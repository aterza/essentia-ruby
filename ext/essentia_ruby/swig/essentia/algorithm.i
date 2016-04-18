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
  catch(essentia::EssentiaException)
  {
    static VALUE err = rb_define_class("EssentiaRuby::EssentiaException", rb_eStandardError);
    rb_raise(err, "Essentia error: " + err);
  }
}

%include "algorithm.h"
