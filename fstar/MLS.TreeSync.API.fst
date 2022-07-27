module MLS.TreeSync.API

open Comparse
open MLS.Crypto
open MLS.NetworkTypes
open MLS.TreeSync.NetworkTypes
open MLS.Tree
open MLS.TreeCommon
open MLS.TreeSync.Level0.Types
open MLS.TreeSync.Level0
open MLS.TreeSync.API.Types
open MLS.Result

val create: #bytes:Type0 -> {|bytes_like bytes|} -> #tkt:treekem_types bytes -> gid:mls_bytes bytes -> leaf_node_nt bytes tkt -> treesync_state bytes tkt
let create #bytes #bl gid lp =
  {
    group_id = gid;
    levels = 0;
    tree = create_tree lp;
    version = 0;
  }

val state_update_tree: #bytes:Type0 -> {|bytes_like bytes|} -> #tkt:treekem_types bytes -> #l:nat -> treesync_state bytes tkt -> treesync bytes tkt l 0 -> treesync_state bytes tkt
let state_update_tree #bytes #bl #tkt #l st new_tree =
  ({ st with
    levels = l;
    version = st.version + 1;
    tree = new_tree;
  })

val get_leaf_package_from_key_package: #bytes:Type0 -> {|crypto_bytes bytes|} -> #tkt:treekem_types bytes -> key_package_nt bytes tkt -> result (leaf_node_nt bytes tkt)
let get_leaf_package_from_key_package #bytes #cb kp =
  //TODO check signature
  if not (kp.tbs.leaf_node.data.source = LNS_key_package ()) then
    error "get_leaf_package_from_key_package: source is not add"
  else (
    return kp.tbs.leaf_node
  )

val add: #bytes:Type0 -> {|crypto_bytes bytes|} -> #tkt:treekem_types bytes -> treesync_state bytes tkt -> key_package_nt bytes tkt -> result (treesync_state bytes tkt & nat)
let add #bytes #bl #tkt st kp =
  lp <-- get_leaf_package_from_key_package kp;
  match find_empty_leaf st.tree with
  | Some i ->
    if not (tree_add_pre st.tree i) then
      error "add: tree_add_pre is false"
    else
      return (state_update_tree st (tree_add st.tree i lp), (i <: nat))
  | None ->
    let augmented_tree = add_one_level st.tree in
    let i = Some?.v (find_empty_leaf augmented_tree) in
    if not (tree_add_pre augmented_tree i) then
      error "add: tree_add_pre is false (after extension)"
    else
      return (state_update_tree st (tree_add augmented_tree i lp), (i <: nat))

val update: #bytes:Type0 -> {|bytes_like bytes|} -> #tkt:treekem_types bytes -> st:treesync_state bytes tkt -> leaf_node_nt bytes tkt -> treesync_index st -> treesync_state bytes tkt
let update #bytes #bl #tkt st lp i =
  state_update_tree st (tree_update st.tree i lp)

val remove: #bytes:Type0 -> {|bytes_like bytes|} -> #tkt:treekem_types bytes -> st:treesync_state bytes tkt -> i:treesync_index st -> treesync_state bytes tkt
let remove #bytes #bl #tkt st i =
  let blanked_tree = (tree_remove st.tree i) in
  let (|_, reduced_tree|) = canonicalize_tree blanked_tree in
  state_update_tree st reduced_tree

val commit: #bytes:Type0 -> {|crypto_bytes bytes|} -> #tkt:treekem_types bytes -> st:treesync_state bytes tkt -> #li:treesync_index st -> external_pathsync bytes tkt st.levels 0 li -> result (treesync_state bytes tkt)
let commit #bytes #cb #tkt st #li p =
  if not (apply_external_path_pre st.tree p) then
    error "commit: bad precondition"
  else
    return (state_update_tree st (apply_external_path st.tree p))
