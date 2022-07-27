module MLS.TreeSync.Level0
open Comparse
open MLS.Crypto
open MLS.NetworkTypes
open MLS.TreeSync.NetworkTypes
open MLS.TreeSync.Level0.Types
open MLS.Tree
open MLS.TreeCommon
open MLS.TreeSync.ParentHash
open MLS.Result

#set-options "--fuel 1 --ifuel 1"

(*** Tree operations ***)

val tree_add: #bytes:Type0 -> {|bytes_like bytes|} -> #tkt:treekem_types bytes -> #l:nat -> #i:tree_index l -> treesync bytes tkt l i -> li:leaf_index l i -> leaf_node_nt bytes tkt -> result (treesync bytes tkt l i)
let rec tree_add #bytes #bl #tkt #l #i t li lp =
  match t with
  | TLeaf _ -> return (TLeaf (Some lp))
  | TNode opt_content left right -> (
    new_opt_content <-- (
      match opt_content with
      | None -> return None
      | Some content -> (
        if not (li < pow2 32) then
          error ""
        else if not (bytes_length #bytes (ps_nat_lbytes 4) (insert_sorted li content.unmerged_leaves) < pow2 30) then
          error ""
        else
          return (Some ({content with unmerged_leaves = insert_sorted li content.unmerged_leaves}))
      )
    );
    if is_left_leaf li then (
      new_left <-- (tree_add left li lp);
      return (TNode new_opt_content new_left right)
    ) else (
      new_right <-- (tree_add right li lp);
      return (TNode new_opt_content left new_right)
    )
  )

val compute_new_np_and_ph: #bytes:Type0 -> {|crypto_bytes bytes|} -> #tkt:treekem_types bytes -> #l:nat -> #i:tree_index l -> option (tkt.node_content) -> treesync bytes tkt l i -> mls_bytes bytes -> result (option (parent_node_nt bytes tkt) & mls_bytes bytes)
let compute_new_np_and_ph #bytes #cb #tkt #l #i opt_ext_content sibling parent_parent_hash =
  let new_opt_content =
    match opt_ext_content with
    | Some ext_content -> Some ({
      content = ext_content;
      parent_hash = parent_parent_hash;
      unmerged_leaves = [];
    } <: parent_node_nt bytes tkt)
    | None -> None
  in
  new_parent_parent_hash <-- (
    match opt_ext_content with
    | Some ext_content ->
      compute_parent_hash ext_content parent_parent_hash sibling
    | None -> return parent_parent_hash
  );
  return (new_opt_content, new_parent_parent_hash)

val compute_leaf_parent_hash_from_external_path: #bytes:Type0 -> {|crypto_bytes bytes|} -> #tkt:treekem_types bytes -> #l:nat -> #i:tree_index l -> #li:leaf_index l i -> t:treesync bytes tkt l i -> external_pathsync bytes tkt l i li -> mls_bytes bytes -> result (mls_bytes bytes)
let rec compute_leaf_parent_hash_from_external_path #bytes #cb #tkt #l #i #li t p parent_parent_hash =
  match t, p with
  | TLeaf old_lp, PLeaf new_lp -> (
    return parent_parent_hash
  )
  | TNode _ left right, PNode opt_ext_content p_next ->
    let (child, sibling) = get_child_sibling t li in
    tmp <-- compute_new_np_and_ph opt_ext_content sibling parent_parent_hash;
    let (_,  new_parent_parent_hash) = tmp in
    if is_left_leaf li then
      compute_leaf_parent_hash_from_external_path left p_next new_parent_parent_hash
    else
      compute_leaf_parent_hash_from_external_path right p_next new_parent_parent_hash

val get_external_path_leaf: #bytes:Type0 -> {|crypto_bytes bytes|} -> #tkt:treekem_types bytes -> #l:nat -> #i:tree_index l -> #li:leaf_index l i -> external_pathsync bytes tkt l i li -> leaf_node_nt bytes tkt
let rec get_external_path_leaf #bytes #cb #tkt #l #i #li p =
  match p with
  | PLeaf lp -> lp
  | PNode _ p_next -> get_external_path_leaf p_next

val set_external_path_leaf: #bytes:Type0 -> {|crypto_bytes bytes|} -> #tkt:treekem_types bytes -> #l:nat -> #i:tree_index l -> #li:leaf_index l i -> external_pathsync bytes tkt l i li -> leaf_node_nt bytes tkt -> external_pathsync bytes tkt l i li
let rec set_external_path_leaf #bytes #cb #tkt #l #i #li p lp =
  match p with
  | PLeaf _ -> PLeaf lp
  | PNode p_content p_next -> PNode p_content (set_external_path_leaf p_next lp)

val get_leaf_package_tbs: #bytes:Type0 -> {|bytes_like bytes|} -> #tkt:treekem_types bytes -> leaf_node_data_nt bytes tkt -> bytes -> result bytes
let get_leaf_package_tbs #bytes #bl #tkt lp_data group_id =
    if not (length group_id < pow2 30) then
      internal_failure "sign_leaf: group_id is too long"
    else (
      let ln_tbs = ({
        data = lp_data;
        group_id = (match lp_data.source with |LNS_update () |LNS_commit() -> group_id |_ -> ());
      } <: leaf_node_tbs_nt bytes tkt) in
      return (serialize (leaf_node_tbs_nt bytes _) ln_tbs)
    )

val external_path_is_valid: #bytes:Type0 -> {|crypto_bytes bytes|} -> #tkt:treekem_types bytes -> #l:nat -> #i:tree_index l -> #li:leaf_index l i -> t:treesync bytes tkt l i -> external_pathsync bytes tkt l i li -> bytes -> result bool
let external_path_is_valid #bytes #cb #tkt #l #i #li t p group_id =
  let old_lp = leaf_at t li in
  let new_lp = get_external_path_leaf p in
  //TODO: something stating that new_lp is related to old_lp
  computed_parent_hash <-- compute_leaf_parent_hash_from_external_path t p root_parent_hash;
  tbs <-- get_leaf_package_tbs new_lp.data group_id;
  verification_key <-- (
    if not (length #bytes new_lp.data.signature_key = sign_public_key_length #bytes) then
      error "external_path_is_valid: verification key has wrong length"
    else
      return (new_lp.data.signature_key <: sign_public_key bytes)
  );
  signature <-- (
    if not (length #bytes new_lp.signature = sign_signature_length #bytes) then
      error "external_path_is_valid: signature has wrong length"
    else
      return (new_lp.signature <: sign_signature bytes)
  );
  if not (length tbs < pow2 30 && sign_with_label_pre #bytes "LeafNodeTBS" tbs) then error "external_path_is_valid: tbs too long"
  else (
    let signature_ok = verify_with_label verification_key "LeafNodeTBS" tbs signature in
    let parent_hash_ok = (new_lp.data.source = LNS_commit () && (new_lp.data.parent_hash <: bytes) = computed_parent_hash) in
    return (signature_ok && parent_hash_ok)
  )

val external_path_to_valid_external_path: #bytes:Type0 -> {|crypto_bytes bytes|} -> #tkt:treekem_types bytes -> #l:nat -> #i:tree_index l -> #li:leaf_index l i -> t:treesync bytes tkt l i -> external_pathsync bytes tkt l i li -> bytes -> sign_private_key bytes -> sign_nonce bytes -> result (external_pathsync bytes tkt l i li)
let external_path_to_valid_external_path #bytes #cb #tkt #l #i #li t p group_id sign_key nonce =
  computed_parent_hash <-- compute_leaf_parent_hash_from_external_path t p root_parent_hash;
  let lp = get_external_path_leaf p in
  if not (lp.data.source = LNS_commit ()) then
    error "external_path_to_valid_external_path: source is not a commit"
  else (
    let new_lp_data = { lp.data with parent_hash = computed_parent_hash; } in
    new_lp_tbs <-- get_leaf_package_tbs new_lp_data group_id;
    if not (length new_lp_tbs < pow2 30 && sign_with_label_pre #bytes "LeafNodeTBS" new_lp_tbs) then error "external_path_to_valid_external_path: tbs too long"
    else (
      let new_signature = sign_with_label sign_key "LeafNodeTBS" new_lp_tbs nonce in
      return (set_external_path_leaf p ({ data = new_lp_data; signature = new_signature }))
    )
  )

val apply_external_path_aux: #bytes:Type0 -> {|crypto_bytes bytes|} -> #tkt:treekem_types bytes -> #l:nat -> #i:tree_index l -> #li:leaf_index l i -> t:treesync bytes tkt l i -> external_pathsync bytes tkt l i li -> mls_bytes bytes -> result (treesync bytes tkt l i)
let rec apply_external_path_aux #bytes #cb #tkt #l #i #li t p parent_parent_hash =
  match t, p with
  | TLeaf _, PLeaf lp -> return (TLeaf (Some lp))
  | TNode _ left right, PNode opt_ext_content p_next ->
    let (child, sibling) = get_child_sibling t li in
    tmp <-- compute_new_np_and_ph opt_ext_content sibling parent_parent_hash;
    let (new_opt_content, new_parent_parent_hash) = tmp in
    if is_left_leaf li then (
      new_left <-- (apply_external_path_aux left p_next new_parent_parent_hash);
      return (TNode new_opt_content new_left right)
    ) else (
      new_right <-- (apply_external_path_aux right p_next new_parent_parent_hash);
      return (TNode new_opt_content left new_right)
    )

val apply_external_path: #bytes:Type0 -> {|crypto_bytes bytes|} -> #tkt:treekem_types bytes -> #l:nat -> #i:tree_index l -> #li:leaf_index l i -> t:treesync bytes tkt l i -> external_pathsync bytes tkt l i li -> result (treesync bytes tkt l i)
let apply_external_path #bytes #cb #tkt #l #i #li t p =
  apply_external_path_aux t p root_parent_hash
