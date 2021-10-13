/// A revised version of the top-level MLS API exposed to clients.
///
/// This is a simplified version that does not expose a notion of commit.
/// Furthermore, we assume that the user is online for all of the group
/// modifications.
module MLS

open MLS.Result

val cs: MLS.Crypto.ciphersuite

val group_id: Type0
val state: group_id -> Type0

// TODO: update this to identity *and* endpoint once we switch to Draft 12
let identity = MLS.Parser.blbytes ({min=0; max=pow2 16-1})
let bytes = Lib.ByteSequence.bytes
let entropy = bytes

let group_message = group_id & bytes
let welcome_message = identity & bytes

noeq
type private_info = {
  private_key: bytes;
}

// Always Ed25519 for the time being.
noeq
type credential = {
  signature_key: MLS.Parser.blbytes ({min=0; max=pow2 16-1});
  identity: identity;
}

// Return a fresh private & public key for signing; the public key is to be
// stored in the key directory. The private key is to be stored locally, and
// passed to `fresh_key_package`.
val fresh_key_pair: e:entropy { Seq.length e == 32 } -> result ((MLS.Crypto.sign_public_key cs) & (MLS.Crypto.sign_private_key cs))

// Assume here that the directory has generated a signing key for us; that our
// public signing key is published somewhere in the directory; and that the
// client of this code passes us both our own participant_id and our own private
// signing key.
//   The application takes care of maintaining a mapping of e.g. hash of a key
// package to private key to be retrieved later if we are ever to receive a
// welcome message encoded with these credentials.
val fresh_key_package: e:entropy { Seq.length e >= 32 } -> credential -> MLS.Crypto.sign_private_key cs -> result (bytes & private_key:bytes)

val current_epoch: #g:_ -> s:state g -> nat

// TODO: expose a way to inject e.g. a uint32 into a group_id
// Note that after we've created the group, we receive our freshly-assigned
// participant id.
val create: entropy → c:credential → g:group_id -> s:state g

// Internally, a new `participant_id` is assigned to the freshly-added user.
// Provided the server does not reject the message, the application can extend
// its mapping from the welcome message's participant_id to the corresponding
// username and endpoint.
val add: #g:group_id -> s:state g → key_package:bytes → group_message & w:welcome_message

val remove: #g:group_id -> s:state g → p:identity → group_message

val update: #g:group_id -> state g → entropy → group_message

// To send application data
val send: #g:group_id -> state g → entropy → bytes → result (state g & group_message)

// The application maintains a local store that maps the hash of a key package
// to the corresponding private key.
let key_callback = bytes -> option bytes

// The application provides a callback to retrieve the private key associated to
// a key package previously generated with `fresh_key_package`.
val process_welcome_message: w:welcome_message → (lookup: key_callback) ->
  option (g:group_id & s:state g)

val process_group_message: #g:group_id -> state g → group_message → result (state g & option bytes)
