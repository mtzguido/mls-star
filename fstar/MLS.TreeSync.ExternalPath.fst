module MLS.TreeSync.ExternalPath

open Comparse
open MLS.Tree
open MLS.Crypto
open MLS.NetworkTypes
open MLS.NetworkBinder
open MLS.TreeSync.ParentHash
open MLS.TreeSync.IntegrityCheck
open MLS.TreeSync.Extensions
open MLS.TreeSync.Types
open MLS.Result

#set-options "--fuel 1 --ifuel 1"

val sign_leaf: #bytes:Type0 -> {|crypto_bytes bytes|} -> sign_private_key bytes -> sign_nonce bytes -> leaf_package_t bytes -> bytes -> bytes -> result (leaf_package_t bytes)
let sign_leaf #bytes #cb sign_key entropy lp parent_parent_hash group_id =
  if not (length parent_parent_hash < pow2 30) then
    internal_failure "sign_leaf: parent hash too long"
  else if not (lp.source = LNS_commit ()) then
    error "sign_leaf: source is not a commit"
  else (
    let lp = ({lp with parent_hash = parent_parent_hash} <: leaf_package_t bytes) in
    ln <-- leaf_package_to_network lp;
    if not (ln.data.source = LNS_commit ()) then
      internal_failure "sign_leaf: source is not a commit (???)"
    else if not (length group_id < pow2 30) then
      internal_failure "sign_leaf: group_id is too long"
    else (
      let ln_tbs = ({
        data = ln.data;
        group_id = group_id;
      } <: leaf_node_tbs_nt bytes) in
      let tbs_bytes = serialize (leaf_node_tbs_nt bytes) ln_tbs in
      new_signature <-- sign_with_label sign_key (string_to_bytes #bytes "LeafNodeTBS") tbs_bytes entropy;
      return ({lp with signature = new_signature} <: leaf_package_t bytes)
    )
  )

val external_pathsync_to_pathsync_aux: #bytes:Type0 -> {|crypto_bytes bytes|} -> #l:nat -> #i:tree_index l -> #li:leaf_index l i -> option (sign_private_key bytes & sign_nonce bytes) -> bytes -> treesync bytes l i -> external_pathsync bytes l i li -> bytes -> result (pathsync bytes l i li)
let rec external_pathsync_to_pathsync_aux #bytes #cb #l #i #li opt_sign_key parent_parent_hash t p group_id =
  match t, p with
  | _, PLeaf lp ->
    lp <-- (
      match opt_sign_key with
      | None -> return lp
      | Some (sign_key, entropy) -> (
        sign_leaf sign_key entropy lp parent_parent_hash group_id
      )
    );
    leaf_errors <-- check_leaf i (Some lp) group_id;
    if not (IE_Good? leaf_errors) then
      error "external_pathsync_to_pathsync_aux: invalid leaf"
    else if not (lp.source = LNS_commit ()) then
      error "external_pathsync_to_pathsync_aux: leaf source isn't commit"
    else if not ((lp.parent_hash <: bytes) = parent_parent_hash) then
      error "external_pathsync_to_pathsync_aux: leaf contain an invalid parent hash"
    else
      return (PLeaf (Some lp))
  | TNode _ left right, PNode onp p_next ->
    let p_next: external_pathsync bytes (l-1) _ li = p_next in //Why F*, why???
    let (child, sibling) = get_child_sibling t li in
    let new_onp =
      match onp with
      | Some np -> (Some ({
        version = 0;
        unmerged_leaves = [];
        parent_hash = parent_parent_hash;
        content = np;
      } <: node_package_t bytes))
      | None -> None
    in
    parent_hash <-- (
      match new_onp with
      | Some new_np -> (
        res <-- compute_parent_hash new_np sibling;
        return (res <: bytes)
      )
      | None -> return parent_parent_hash
    );
    result_p_next <-- external_pathsync_to_pathsync_aux opt_sign_key parent_hash child p_next group_id;
    return (PNode new_onp result_p_next)

val external_pathsync_to_pathsync: #bytes:Type0 -> {|crypto_bytes bytes|} -> #l:nat -> #i:tree_index l -> #li:leaf_index l i -> option (sign_private_key bytes & sign_nonce bytes) -> treesync bytes l i -> external_pathsync bytes l i li -> bytes -> result (pathsync bytes l i li)
let external_pathsync_to_pathsync #bytes #cb #l #i #li opt_sign_key t p group_id =
  external_pathsync_to_pathsync_aux opt_sign_key empty t p group_id

