
%fieldname = type {
  i32, ; len
  i32, ; hash
  [ 0 x i8 ] ; data
}

; Reifying types is for future work :D

%typetable.hdr = type {
  i8, ; shift count left
  i8, ; shift count right
  i16 ; item count
}

%typetable.entry = type <{
  %fieldname*,
  i16
}>

%typetable = type {
  %typetable.hdr,  ; header data
  [ 0 x %value ]*, ; pointer to per-class objects
  [ 0 x %typetable.entry ]      ; index buffer
}

%value = type %object* ; in future, may use some hax to unbox integers

%object = type { 
  %typetable*,     ; type field contains vtables, etc.
  [ 0 x %value ]   ; value part is stored after type field
}

define %typetable* @object_get_type(%object* %obj){
  %1 = getelementptr %object* %obj, i32 0, i32 0
  %2 = load %typetable** %1
  ret %typetable* %2
}

declare noalias %value @gcalloc(%typetable*)

%ptrsz = type i32

declare i16 @typetable_get_index(%typetable*,  %fieldname*) readnone
;;define i16 @object_get_index(%typetable* %T, i32 %hash, %fieldname* %field){
;;  %1 = getelementptr %typetable* %T, i32 0, i32 0, i32 0
;;  %shl8 = load i8* %1
;;  %shl32 = zext i8 %shl8 to i32
;;  %2 = getelementptr %typetable* %T, i32 0, i32 0, i32 1
;;  %shr8 = load i8* %2
;;  %shr32 = zext i8 %shr8 to i32
;;
;;  %3 = shl i32 %hash, %shl32
;;  %4 = lshr i32 %3, %shr32
;;  %ptr = getelementptr %typetable* %T, i32 0, i32 2, i32 %4
;;
;;
;;  %entry1 = load %typetable.entry* %ptr
;;  %5 = getelementptr %typetable.entry* %ptr, i64 1
;;  %entry2 = load %typetable.entry* %5
;;
;;  %hash1 = extractvalue %typetable.entry %entry1, 0
;;  %hash2 = extractvalue %typetable.entry %entry2, 0
;;  %off1 = extractvalue %typetable.entry %entry1, 1
;;  %off2 = extractvalue %typetable.entry %entry2, 1
;;
;;  %found1 = icmp eq i32 %hash1, %hash
;;  %idx = select i1 %found1, i16 %off1, i16 %off2
;;  ret i16 %idx
;;}

define void @object_set_field(%object* %obj, i16 %idx, %value %v){
  %1 = getelementptr %object* %obj, i32 0, i32 1, i16 %idx
  store %value %v, %value* %1
  ret void
}
define %value @object_get_field(%object* %obj, i16 %idx){
  %1 = getelementptr %object* %obj, i32 0, i32 1, i16 %idx
  %2 = load %value* %1
  ret %value %2
}




@i = global %object* null
@j = global %object* null