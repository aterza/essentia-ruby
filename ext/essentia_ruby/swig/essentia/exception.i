//
// This is a handler for Essentia exceptions. There is no equivalent handler
// in the c++ code, though. Everything is in types.h.
//
%{
  #include "types.h"
%}

%include "types.h"

%exception {
  try
  {
    $action;
  }
  catch(const essentia::EssentiaException &e)
  {
    static VALUE err = rb_define_class("Essentia::Exception", rb_eStandardError);
    rb_raise(err, "Essentia error: %s", e.what());
  }
}
