//
// SWIG Wrapper for essentia's Algorithm class
//
%module essentia_ruby
%{
  #include "algorithm.h"
%}

%exception {
  try
  {
    $action;
  }
  catch(essentia::EssentiaException &e)
  {
    static VALUE err = rb_define_class("Essentia_ruby::EssentiaException", rb_eStandardError);
    rb_raise(err, "Essentia error: %s", e.what());
  }
}

%include "algorithm.h"
