module MLS.TreeSyncTreeKEMBinder

open Comparse
open MLS.Crypto
open MLS.TreeSync.NetworkTypes
open MLS.TreeKEM.NetworkTypes
open MLS.Tree
open MLS.TreeSync.Types
open MLS.TreeKEM.Types
open MLS.Result

#set-options "--fuel 1 --ifuel 1"

val treesync_to_treekem_node_package:
  #bytes:Type0 -> {|crypto_bytes bytes|} ->
  parent_node_nt bytes tkt ->
  result (treekem_node bytes)
let treesync_to_treekem_node_package #bytes #cb np =
  return ({
    public_key = np.content;
    unmerged_leaves = List.Tot.map #(nat_lbytes 4) #nat (fun x -> x) np.unmerged_leaves;
  })

// This does not contain any internal TreeKEM data. To be used then joining a new group.
val treesync_to_treekem:
  #bytes:Type0 -> {|crypto_bytes bytes|} ->
  #l:nat -> #i:tree_index l ->
  treesync bytes tkt l i ->
  result (treekem bytes l i)
let rec treesync_to_treekem #bytes #cb #l #i t =
  match t with
  | TLeaf None ->
    return (TLeaf None)
  | TLeaf (Some lp) ->
    return (TLeaf (Some ({public_key = lp.data.content} <: treekem_leaf bytes)))
  | TNode onp left right -> begin
    let? tk_left = treesync_to_treekem left in
    let? tk_right = treesync_to_treekem right in
    match onp with
    | None ->
      return (TNode None tk_left tk_right)
    | Some np ->
      let? kp = treesync_to_treekem_node_package np in
      return (TNode (Some kp) tk_left tk_right)
  end

//This function is used to authenticate data generated by TreeKEM. It allows TreeSync to handle parent hash + signature.
val treekem_to_treesync:
  #bytes:Type0 -> {|crypto_bytes bytes|} ->
  #l:nat -> #i:tree_index l -> #li:leaf_index l i ->
  leaf_node_data_nt bytes tkt -> pre_pathkem bytes l i li ->
  result (external_pathsync bytes tkt l i li)
let rec treekem_to_treesync #bytes #cb #l #i #li new_leaf_package pk =
  match pk with
  | PLeaf mi ->
    let? content = mk_mls_bytes mi.public_key "treekem_to_treesync" "content" in
    return (PLeaf ({
      new_leaf_package with
      content;
    } <: leaf_node_data_nt bytes tkt))
  | PNode okp pk_next ->
    let? next = treekem_to_treesync new_leaf_package pk_next in
    return (PNode okp next)
