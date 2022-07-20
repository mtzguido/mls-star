module MLS.TreeSyncTreeKEMBinder

open Comparse
open MLS.Crypto
open MLS.NetworkTypes
open MLS.TreeSync.NetworkTypes
open MLS.TreeDEM.NetworkTypes //for hpke_ciphertext_nt
open MLS.Tree
open MLS.NetworkBinder
open MLS.TreeSync.Types
open MLS.TreeKEM.Types
open MLS.Result

#set-options "--fuel 1 --ifuel 1"

val encrypted_path_secret_nt_to_tk: #bytes:Type0 -> {|crypto_bytes bytes|} -> hpke_ciphertext_nt bytes -> result (path_secret_ciphertext bytes)
let encrypted_path_secret_nt_to_tk #bytes #cb x =
  if not (length (x.kem_output <: bytes) = hpke_kem_output_length #bytes) then
    internal_failure "encrypted_path_secret_nt_to_tk: kem_output has wrong length"
  else
    return ({
      kem_output = x.kem_output;
      ciphertext = x.ciphertext;
    })

val treesync_to_treekem_node_package: #bytes:Type0 -> {|crypto_bytes bytes|} -> node_package_t bytes -> result (key_package bytes)
let treesync_to_treekem_node_package #bytes #cb np =
  content <-- from_option "treesync_to_treekem_node_package: Couldn't parse node content"
    (parse (treekem_content_nt bytes) np.content.content);
  impl_data <-- from_option "treesync_to_treekem_node_package: Couldn't parse node impl data"
    (parse (treekem_impl_data_nt bytes) np.content.impl_data);
  path_secret_ciphertext <-- mapM (encrypted_path_secret_nt_to_tk #bytes) (Seq.seq_to_list impl_data.encrypted_path_secret);
  if not (length (content.encryption_key <: bytes) = hpke_public_key_length #bytes) then
    error "treesync_to_treekem_node_package: public key has wrong length"
  else (
    return ({
      public_key = content.encryption_key;
      version = np.version;
      last_group_context = impl_data.last_group_context;
      unmerged_leaves = np.unmerged_leaves;
      path_secret_from = impl_data.content_dir;
      path_secret_ciphertext = path_secret_ciphertext;
    })
  )

val treesync_to_treekem: #bytes:Type0 -> {|crypto_bytes bytes|} -> #l:nat -> #i:tree_index l -> treesync bytes l i -> result (treekem bytes l i)
let rec treesync_to_treekem #bytes #cb #l #i t =
  match t with
  | TLeaf None ->
    return (TLeaf None)
  | TLeaf (Some lp) ->
    lpc <-- from_option "treesync_to_treekem: Couldn't parse leaf content"
      (parse (treekem_content_nt bytes) lp.content.content);
    if length (lpc.encryption_key <: bytes) = hpke_public_key_length #bytes then
      return (TLeaf (Some ({public_key = lpc.encryption_key; version = lp.version} <: member_info bytes)))
    else
      error "treesync_to_treekem: public key has wrong length"
  | TNode onp left right -> begin
    tk_left <-- treesync_to_treekem left;
    tk_right <-- treesync_to_treekem right;
    match onp with
    | None ->
      return (TNode None tk_left tk_right)
    | Some np ->
      kp <-- treesync_to_treekem_node_package np;
      return (TNode (Some kp) tk_left tk_right)
  end

val encrypted_path_secret_tk_to_nt: #bytes:Type0 -> {|crypto_bytes bytes|} -> path_secret_ciphertext bytes -> result (hpke_ciphertext_nt bytes)
let encrypted_path_secret_tk_to_nt #bytes #cb x =
  if not (length (x.kem_output <: bytes) < pow2 30) then
    internal_failure "encrypted_path_secret_tk_to_nt: kem_output too long"
  else if not (length (x.ciphertext <: bytes) < pow2 30) then
    internal_failure "encrypted_path_secret_tk_to_nt: ciphertext too long"
  else
    return ({
      kem_output = x.kem_output;
      ciphertext = x.ciphertext;
    } <: hpke_ciphertext_nt bytes)

val treekem_to_treesync_node_package: #bytes:Type0 -> {|crypto_bytes bytes|} -> key_package bytes -> result (external_content bytes)
let treekem_to_treesync_node_package #bytes #cb kp =
  ciphertexts <-- mapM encrypted_path_secret_tk_to_nt kp.path_secret_ciphertext;
  if not (bytes_length ps_hpke_ciphertext_nt ciphertexts < pow2 30) then
    internal_failure "treekem_to_treesync: ciphertexts too long"
  else if not (length kp.last_group_context < pow2 30) then
    internal_failure "treekem_to_treesync: last group context too long (internal error)"
  else begin
    Seq.lemma_list_seq_bij ciphertexts;
    return ({
      content = serialize (treekem_content_nt bytes) ({
        encryption_key = kp.public_key;
      });
      impl_data = serialize (treekem_impl_data_nt bytes) ({
        content_dir = kp.path_secret_from;
        encrypted_path_secret = Seq.seq_of_list ciphertexts;
        last_group_context = kp.last_group_context;
      });
    } <: external_content bytes)
  end

// Some remarks about the `new_leaf_package` argument
// This function is used in two cases:
// - By processing an update path coming from the network. In that case, the update path provided a new leaf package to use, which will go in this `new_leaf_package` argument.
//   Why change its public key in that case? Well it doesn't really change, because the public key in `PLeaf` and the public key of `new_leaf_package` will be the same.
//   This is because the `PLeaf` content is equal to `key_package_to_treekem kp` and `new_leaf_package` is equal to `key_package_to_treesync kp` for the same kp
//   The parent hash extension and the signature will be checked when converting the external_pathsync to a pathsync
// - When we generate an updatepath, and convert it to treesync before converting it to an update_path_nt.
//   In that case, `new_leaf_package` need to be equal to our previous leaf package. The HPKE public key will be updated here.
//   The parent hash and signature need to be updated, but this will be done in the external_pathsync -> pathsync conversion.
val treekem_to_treesync: #bytes:Type0 -> {|crypto_bytes bytes|} -> #l:nat -> #i:tree_index l -> #li:leaf_index l i -> leaf_package_t bytes -> pathkem bytes l i li -> result (external_pathsync bytes l i li)
let rec treekem_to_treesync #bytes #cb #l #i #li new_leaf_package pk =
  match pk with
  | PLeaf mi ->
    return (PLeaf ({
      new_leaf_package with
      version = (mi <: member_info bytes).version;
      content = {
        content = serialize (treekem_content_nt bytes) ({
          encryption_key = (mi <: member_info bytes).public_key;
        });
        impl_data = empty;
      };
    } <: leaf_package_t bytes))
  | PNode okp pk_next ->
    next <-- treekem_to_treesync new_leaf_package pk_next;
    match okp with
    | Some kp -> (
      np <-- treekem_to_treesync_node_package kp;
      return (PNode (Some np) next)
    )
    | None -> (
      return (PNode None next)
    )
