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
    static VALUE err = rb_define_class("Essentia_ruby::EssentiaException", rb_eStandardError);
    rb_raise(err, "Essentia error: %s", e.what());
  }
}
