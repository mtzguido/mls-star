module TreeDEM

open Parser
open CryptoMLS
open Lib.IntTypes
open Lib.ByteSequence
open Lib.Result
open TreeMath

let index_l (l:nat) = x:nat{x < pow2 l}
type direction = | Left | Right
let child_index (l:pos) (i:index_l l) : index_l (l-1) & direction =
  if i < pow2 (l - 1) then (i,Left) else (i-pow2 (l-1),Right)

noeq type tree_context_nt = {
  tc_node: uint32;
  tc_generation: uint32;
}

val ps_tree_context: parser_serializer tree_context_nt
let ps_tree_context =
  let open Parser in //Use `Parser.bind` in this function
  isomorphism tree_context_nt
    (
      _ <-- ps_u32;
      ps_u32
    )
    (fun (|node, generation|) -> {tc_node=node; tc_generation=generation})
    (fun x -> (|x.tc_node, x.tc_generation|))

val derive_tree_secret: cs:ciphersuite -> secret:bytes -> label:bytes -> node:nat -> generation:nat -> len:size_nat -> result (lbytes len)
let derive_tree_secret cs secret label node generation len =
  let open Parser in
  if not (node < pow2 32) then
    fail "derive_tree_secret: node too high"
  else if not (generation < pow2 32) then
    fail "derive_tree_secret: generation too high"
  else
    let tree_context = ps_tree_context.serialize ({
      tc_node = u32 node;
      tc_generation = u32 generation;
    }) in
    expand_with_label cs secret label tree_context len

val leaf_kdf: #l:nat -> ciphersuite -> bytes -> node_index l -> index_l l -> result bytes
let rec leaf_kdf #l cs encryption_secret root leaf_index =
  if l = 0 then (
    return encryption_secret
  ) else (
    let (new_leaf_index, dir) = child_index l leaf_index in
    let new_root = (if dir = Left then left root else right root) in
    new_encryption_secret <-- derive_tree_secret cs encryption_secret (string_to_bytes "tree") new_root 0 (kdf_length cs);
    leaf_kdf cs new_encryption_secret new_root new_leaf_index
  )

val secret_init_to_joiner: cs:ciphersuite -> bytes -> bytes -> result (lbytes (kdf_length cs))
let secret_init_to_joiner cs init_secret commit_secret =
  prk <-- kdf_extract cs init_secret commit_secret;
  derive_secret cs prk (string_to_bytes "joiner")

val secret_joiner_to_epoch: cs:ciphersuite -> bytes -> bytes -> bytes -> result (lbytes (kdf_length cs))
let secret_joiner_to_epoch cs joiner_secret psk_secret group_context =
  prk <-- kdf_extract cs joiner_secret psk_secret;
  expand_with_label cs prk (string_to_bytes "epoch") group_context (kdf_length cs)

val secret_epoch_to_encryption: cs:ciphersuite -> bytes -> result (lbytes (kdf_length cs))
let secret_epoch_to_encryption cs epoch_secret =
  derive_secret cs epoch_secret (string_to_bytes "encryption")

val secret_epoch_to_init: cs:ciphersuite -> bytes -> result (lbytes (kdf_length cs))
let secret_epoch_to_init cs epoch_secret =
  derive_secret cs epoch_secret (string_to_bytes "init")

