#include "essentia_ruby.h"

VALUE rb_mEssentiaRuby;

void
Init_essentia_ruby(void)
{
  rb_mEssentiaRuby = rb_define_module("EssentiaRuby");
}
