#include <stdio.h>
typedef unsigned char u8;
typedef unsigned int u32;
typedef unsigned short u16;

struct fieldname{
  u32 len, hash;
  char data[1];
};

struct typetable_hdr{
  u8 shl, shr;
  u16 nitems;
};

struct typetable_entry{
  struct fieldname* ptr;
  u16 offset;
};


struct typetable{
  struct typetable_hdr hdr;
  struct value* perclass;
  struct typetable_entry offsets[1];
};

struct object{
  struct typetable* type;
  struct object* data[];
};


u16 object_get_index(struct typetable* t, u32 hash, struct fieldname* field){
  struct typetable_entry* i = &t->offsets[0];
  while (i->ptr != field) i++;
  return i->offset;
}

void dump_object(struct object* obj){
  struct typetable* t = obj->type;
  for (int i=0; i<t->hdr->nitems; i++){
    printf("%.*s %d\n", t->offsets[i].ptr->len, t->offsets[i].ptr->data, obj->data[t->offsets[i].offset])
  }
}

void int_add(struct object* o1, struct object* o2, struct object** res){
  *(int*)res = (int)o1 + (int)o2;
}
struct object* int_new(int x){
  return (struct object*)x;
}
