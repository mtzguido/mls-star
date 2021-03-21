open Prims
let (test1_plaintext : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63))]
let (test1_expected224 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x23));
    FStar_UInt8.uint_to_t (Prims.of_int (0x09));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x22));
    FStar_UInt8.uint_to_t (Prims.of_int (0x34));
    FStar_UInt8.uint_to_t (Prims.of_int (0x05));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x22));
    FStar_UInt8.uint_to_t (Prims.of_int (0x86));
    FStar_UInt8.uint_to_t (Prims.of_int (0x42));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x77));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x55));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xad));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa7))]
let (test1_expected256 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xba));
    FStar_UInt8.uint_to_t (Prims.of_int (0x78));
    FStar_UInt8.uint_to_t (Prims.of_int (0x16));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8f));
    FStar_UInt8.uint_to_t Prims.int_one;
    FStar_UInt8.uint_to_t (Prims.of_int (0xcf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xea));
    FStar_UInt8.uint_to_t (Prims.of_int (0x41));
    FStar_UInt8.uint_to_t (Prims.of_int (0x41));
    FStar_UInt8.uint_to_t (Prims.of_int (0x40));
    FStar_UInt8.uint_to_t (Prims.of_int (0xde));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xae));
    FStar_UInt8.uint_to_t (Prims.of_int (0x22));
    FStar_UInt8.uint_to_t (Prims.of_int (0x23));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x96));
    FStar_UInt8.uint_to_t (Prims.of_int (0x17));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x10));
    FStar_UInt8.uint_to_t (Prims.of_int (0xff));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf2));
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t (Prims.of_int (0x15));
    FStar_UInt8.uint_to_t (Prims.of_int (0xad))]
let (test1_expected384 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xcb));
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x45));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x50));
    FStar_UInt8.uint_to_t (Prims.of_int (0x07));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x32));
    FStar_UInt8.uint_to_t (Prims.of_int (0xab));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xde));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x60));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x43));
    FStar_UInt8.uint_to_t (Prims.of_int (0xff));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xed));
    FStar_UInt8.uint_to_t (Prims.of_int (0x80));
    FStar_UInt8.uint_to_t (Prims.of_int (0x86));
    FStar_UInt8.uint_to_t (Prims.of_int (0x07));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x23));
    FStar_UInt8.uint_to_t (Prims.of_int (0x58));
    FStar_UInt8.uint_to_t (Prims.of_int (0xba));
    FStar_UInt8.uint_to_t (Prims.of_int (0xec));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x34));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x25));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa7))]
let (test1_expected512 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x93));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xba));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x41));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x49));
    FStar_UInt8.uint_to_t (Prims.of_int (0xae));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x41));
    FStar_UInt8.uint_to_t (Prims.of_int (0x31));
    FStar_UInt8.uint_to_t (Prims.of_int (0x12));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfa));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x89));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xee));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x55));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x21));
    FStar_UInt8.uint_to_t (Prims.of_int (0x92));
    FStar_UInt8.uint_to_t (Prims.of_int (0x99));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x36));
    FStar_UInt8.uint_to_t (Prims.of_int (0xba));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x23));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfe));
    FStar_UInt8.uint_to_t (Prims.of_int (0xeb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x45));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x44));
    FStar_UInt8.uint_to_t (Prims.of_int (0x23));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9f))]
let (test2_plaintext : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x) []
let (test2_expected224 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xd1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x02));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x47));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x02));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x28));
    FStar_UInt8.uint_to_t (Prims.of_int (0x82));
    FStar_UInt8.uint_to_t (Prims.of_int (0x34));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x15));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x82));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2f))]
let (test2_expected256 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xe3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x42));
    FStar_UInt8.uint_to_t (Prims.of_int (0x98));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x14));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x99));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x24));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0xae));
    FStar_UInt8.uint_to_t (Prims.of_int (0x41));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x93));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x95));
    FStar_UInt8.uint_to_t (Prims.of_int (0x99));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x78));
    FStar_UInt8.uint_to_t (Prims.of_int (0x52));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x55))]
let (test2_expected384 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x60));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x51));
    FStar_UInt8.uint_to_t (Prims.of_int (0xac));
    FStar_UInt8.uint_to_t (Prims.of_int (0x96));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x32));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x21));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x11));
    FStar_UInt8.uint_to_t (Prims.of_int (0x14));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbe));
    FStar_UInt8.uint_to_t (Prims.of_int (0x07));
    FStar_UInt8.uint_to_t (Prims.of_int (0x43));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xda));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xde));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfb));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x48));
    FStar_UInt8.uint_to_t (Prims.of_int (0x98));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5b))]
let (test2_expected512 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xcf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x83));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xef));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x54));
    FStar_UInt8.uint_to_t (Prims.of_int (0x28));
    FStar_UInt8.uint_to_t (Prims.of_int (0x50));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x80));
    FStar_UInt8.uint_to_t (Prims.of_int (0x07));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x05));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x57));
    FStar_UInt8.uint_to_t (Prims.of_int (0x15));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x83));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x21));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xce));
    FStar_UInt8.uint_to_t (Prims.of_int (0x47));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x85));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xff));
    FStar_UInt8.uint_to_t (Prims.of_int (0x83));
    FStar_UInt8.uint_to_t (Prims.of_int (0x18));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x87));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xec));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x31));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x47));
    FStar_UInt8.uint_to_t (Prims.of_int (0x41));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x81));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0x32));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0xda));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3e))]
let (test3_plaintext : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x70));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x70));
    FStar_UInt8.uint_to_t (Prims.of_int (0x71))]
let (test3_expected224 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x16));
    FStar_UInt8.uint_to_t (Prims.of_int (0x51));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0x76));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xba));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x89));
    FStar_UInt8.uint_to_t Prims.int_one;
    FStar_UInt8.uint_to_t (Prims.of_int (0x50));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x45));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x19));
    FStar_UInt8.uint_to_t (Prims.of_int (0x52));
    FStar_UInt8.uint_to_t (Prims.of_int (0x52));
    FStar_UInt8.uint_to_t (Prims.of_int (0x25));
    FStar_UInt8.uint_to_t (Prims.of_int (0x25))]
let (test3_expected256 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x24));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x06));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x26));
    FStar_UInt8.uint_to_t (Prims.of_int (0x93));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x60));
    FStar_UInt8.uint_to_t (Prims.of_int (0x39));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x59));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0xff));
    FStar_UInt8.uint_to_t (Prims.of_int (0x21));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xec));
    FStar_UInt8.uint_to_t (Prims.of_int (0xed));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x19));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x06));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1))]
let (test3_expected384 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0x91));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x39));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0x07));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x47));
    FStar_UInt8.uint_to_t (Prims.of_int (0x09));
    FStar_UInt8.uint_to_t (Prims.of_int (0x39));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb1));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x05));
    FStar_UInt8.uint_to_t (Prims.of_int (0xab));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfe));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x45));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe5));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x45));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x85));
    FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0xbc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x45));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2b))]
let (test3_expected512 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x20));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xed));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xeb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x08));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x16));
    FStar_UInt8.uint_to_t (Prims.of_int (0x57));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x28));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x27));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x31));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x35));
    FStar_UInt8.uint_to_t (Prims.of_int (0x96));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x15));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x07));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaa));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xea));
    FStar_UInt8.uint_to_t (Prims.of_int (0x57));
    FStar_UInt8.uint_to_t (Prims.of_int (0x78));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x31));
    FStar_UInt8.uint_to_t (Prims.of_int (0xad));
    FStar_UInt8.uint_to_t (Prims.of_int (0x85));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0x54));
    FStar_UInt8.uint_to_t (Prims.of_int (0xec));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x12));
    FStar_UInt8.uint_to_t (Prims.of_int (0x38));
    FStar_UInt8.uint_to_t (Prims.of_int (0xca));
    FStar_UInt8.uint_to_t (Prims.of_int (0x34));
    FStar_UInt8.uint_to_t (Prims.of_int (0x45))]
let (test4_plaintext : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x61));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x62));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x63));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x64));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x65));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x67));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x68));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x69));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x70));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x70));
    FStar_UInt8.uint_to_t (Prims.of_int (0x71));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x70));
    FStar_UInt8.uint_to_t (Prims.of_int (0x71));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x70));
    FStar_UInt8.uint_to_t (Prims.of_int (0x71));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x70));
    FStar_UInt8.uint_to_t (Prims.of_int (0x71));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x70));
    FStar_UInt8.uint_to_t (Prims.of_int (0x71));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x73));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75))]
let (test4_expected224 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xc9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x59));
    FStar_UInt8.uint_to_t (Prims.of_int (0x85));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xef));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x99));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe2));
    FStar_UInt8.uint_to_t (Prims.of_int (0xab));
    FStar_UInt8.uint_to_t (Prims.of_int (0x14));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x26));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb3))]
let (test4_expected256 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0xcf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x16));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x78));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaf));
    FStar_UInt8.uint_to_t (Prims.of_int (0x83));
    FStar_UInt8.uint_to_t (Prims.of_int (0x80));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0x6c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x04));
    FStar_UInt8.uint_to_t (Prims.of_int (0x92));
    FStar_UInt8.uint_to_t (Prims.of_int (0x37));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x24));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x11));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe8));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x51));
    FStar_UInt8.uint_to_t (Prims.of_int (0xaf));
    FStar_UInt8.uint_to_t (Prims.of_int (0xac));
    FStar_UInt8.uint_to_t (Prims.of_int (0x45));
    FStar_UInt8.uint_to_t (Prims.of_int (0x03));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfe));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd1))]
let (test4_expected384 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x09));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0x0c));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x11));
    FStar_UInt8.uint_to_t (Prims.of_int (0x47));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe8));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x19));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x82));
    FStar_UInt8.uint_to_t (Prims.of_int (0xcd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x47));
    FStar_UInt8.uint_to_t (Prims.of_int (0x53));
    FStar_UInt8.uint_to_t (Prims.of_int (0x11));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x17));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x05));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd2));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa0));
    FStar_UInt8.uint_to_t (Prims.of_int (0x80));
    FStar_UInt8.uint_to_t (Prims.of_int (0x86));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb0));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x12));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfc));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1a));
    FStar_UInt8.uint_to_t (Prims.of_int (0x55));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x2d));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x66));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc3));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe9));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfa));
    FStar_UInt8.uint_to_t (Prims.of_int (0x91));
    FStar_UInt8.uint_to_t (Prims.of_int (0x74));
    FStar_UInt8.uint_to_t (Prims.of_int (0x60));
    FStar_UInt8.uint_to_t (Prims.of_int (0x39))]
let (test4_expected512 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x)
    [FStar_UInt8.uint_to_t (Prims.of_int (0x8e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x95));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x75));
    FStar_UInt8.uint_to_t (Prims.of_int (0xda));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x13));
    FStar_UInt8.uint_to_t (Prims.of_int (0xda));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8c));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xf7));
    FStar_UInt8.uint_to_t (Prims.of_int (0x28));
    FStar_UInt8.uint_to_t (Prims.of_int (0x14));
    FStar_UInt8.uint_to_t (Prims.of_int (0xfc));
    FStar_UInt8.uint_to_t (Prims.of_int (0x14));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x8f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x77));
    FStar_UInt8.uint_to_t (Prims.of_int (0x79));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xeb));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9f));
    FStar_UInt8.uint_to_t (Prims.of_int (0x7f));
    FStar_UInt8.uint_to_t (Prims.of_int (0xa1));
    FStar_UInt8.uint_to_t (Prims.of_int (0x72));
    FStar_UInt8.uint_to_t (Prims.of_int (0x99));
    FStar_UInt8.uint_to_t (Prims.of_int (0xae));
    FStar_UInt8.uint_to_t (Prims.of_int (0xad));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb6));
    FStar_UInt8.uint_to_t (Prims.of_int (0x88));
    FStar_UInt8.uint_to_t (Prims.of_int (0x90));
    FStar_UInt8.uint_to_t (Prims.of_int (0x18));
    FStar_UInt8.uint_to_t (Prims.of_int (0x50));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1d));
    FStar_UInt8.uint_to_t (Prims.of_int (0x28));
    FStar_UInt8.uint_to_t (Prims.of_int (0x9e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x49));
    FStar_UInt8.uint_to_t Prims.int_zero;
    FStar_UInt8.uint_to_t (Prims.of_int (0xf7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe4));
    FStar_UInt8.uint_to_t (Prims.of_int (0x33));
    FStar_UInt8.uint_to_t (Prims.of_int (0x1b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x99));
    FStar_UInt8.uint_to_t (Prims.of_int (0xde));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc4));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x43));
    FStar_UInt8.uint_to_t (Prims.of_int (0x3a));
    FStar_UInt8.uint_to_t (Prims.of_int (0xc7));
    FStar_UInt8.uint_to_t (Prims.of_int (0xd3));
    FStar_UInt8.uint_to_t (Prims.of_int (0x29));
    FStar_UInt8.uint_to_t (Prims.of_int (0xee));
    FStar_UInt8.uint_to_t (Prims.of_int (0xb6));
    FStar_UInt8.uint_to_t (Prims.of_int (0xdd));
    FStar_UInt8.uint_to_t (Prims.of_int (0x26));
    FStar_UInt8.uint_to_t (Prims.of_int (0x54));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5e));
    FStar_UInt8.uint_to_t (Prims.of_int (0x96));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe5));
    FStar_UInt8.uint_to_t (Prims.of_int (0x5b));
    FStar_UInt8.uint_to_t (Prims.of_int (0x87));
    FStar_UInt8.uint_to_t (Prims.of_int (0x4b));
    FStar_UInt8.uint_to_t (Prims.of_int (0xe9));
    FStar_UInt8.uint_to_t (Prims.of_int (0x09))]
let (test5_expected224 : FStar_UInt8.t Prims.list) =
  FStar_List_Tot_Base.map (fun x -> x) []
let (print_and_compare :
  Prims.string ->
    Prims.string ->
      Prims.nat ->
        (FStar_UInt8.t, unit) Lib_Sequence.lseq ->
          (FStar_UInt8.t, unit) Lib_Sequence.lseq -> Prims.bool)
  =
  fun str1 ->
    fun str2 ->
      fun len ->
        fun test_expected ->
          fun test_result ->
            FStar_IO.print_string str1;
            FStar_List.iter
              (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
              (Lib_Sequence.to_list test_expected);
            FStar_IO.print_string str2;
            FStar_List.iter
              (fun a -> FStar_IO.print_string (FStar_UInt8.to_string a))
              (Lib_Sequence.to_list test_result);
            Lib_Sequence.for_all2 len
              (fun a ->
                 fun b ->
                   (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                      (Obj.magic a))
                     =
                     (Lib_IntTypes.v Lib_IntTypes.U8 Lib_IntTypes.SEC
                        (Obj.magic b))) test_expected test_result
let (test_sha2 :
  Prims.nat ->
    FStar_UInt8.t Prims.list ->
      FStar_UInt8.t Prims.list ->
        FStar_UInt8.t Prims.list ->
          FStar_UInt8.t Prims.list -> FStar_UInt8.t Prims.list -> Prims.bool)
  =
  fun msg_len ->
    fun msg ->
      fun expected224 ->
        fun expected256 ->
          fun expected384 ->
            fun expected512 ->
              let msg1 = Lib_Sequence.of_list msg in
              let expected2241 = Lib_Sequence.of_list expected224 in
              let expected2561 = Lib_Sequence.of_list expected256 in
              let expected3841 = Lib_Sequence.of_list expected384 in
              let expected5121 = Lib_Sequence.of_list expected512 in
              let test224 =
                Spec_Agile_Hash.hash Spec_Hash_Definitions.SHA2_224 msg1 in
              let test256 =
                Spec_Agile_Hash.hash Spec_Hash_Definitions.SHA2_256 msg1 in
              let test384 =
                Spec_Agile_Hash.hash Spec_Hash_Definitions.SHA2_384 msg1 in
              let test512 =
                Spec_Agile_Hash.hash Spec_Hash_Definitions.SHA2_512 msg1 in
              let r224 =
                print_and_compare "\nExpected SHA2 224: "
                  "\nComputed SHA2 224: " (Prims.of_int (28)) expected2241
                  test224 in
              let r256 =
                print_and_compare "\nExpected SHA2 256: "
                  "\nComputed SHA2 256: " (Prims.of_int (32)) expected2561
                  test256 in
              let r384 =
                print_and_compare "\nExpected SHA2 384: "
                  "\nComputed SHA2 384: " (Prims.of_int (48)) expected3841
                  test384 in
              let r512 =
                print_and_compare "\nExpected SHA2 512: "
                  "\nComputed SHA2 512: " (Prims.of_int (64)) expected5121
                  test512 in
              let res = ((r224 && r256) && r384) && r512 in
              if res
              then FStar_IO.print_string "\nSHA2 Test: Success!\n"
              else FStar_IO.print_string "\nSHA2 Test: Failure :(\n";
              res
let (test : unit -> Prims.bool) =
  fun uu___ ->
    FStar_IO.print_string "\nTEST 1\n";
    (let result1 =
       test_sha2 (Prims.of_int (3)) test1_plaintext test1_expected224
         test1_expected256 test1_expected384 test1_expected512 in
     FStar_IO.print_string "\nTEST 2\n";
     (let result2 =
        test_sha2 Prims.int_zero test2_plaintext test2_expected224
          test2_expected256 test2_expected384 test2_expected512 in
      FStar_IO.print_string "\nTEST 3\n";
      (let result3 =
         test_sha2 (Prims.of_int (56)) test3_plaintext test3_expected224
           test3_expected256 test3_expected384 test3_expected512 in
       FStar_IO.print_string "\nTEST 4\n";
       (let result4 =
          test_sha2 (Prims.of_int (112)) test4_plaintext test4_expected224
            test4_expected256 test4_expected384 test4_expected512 in
        if ((result1 && result2) && result3) && result4
        then
          (FStar_IO.print_string "\nComposite result: Success! \\o/ \n"; true)
        else
          (FStar_IO.print_string "\nComposite result: Failure :(\n"; false)))))