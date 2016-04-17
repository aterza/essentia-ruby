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
    static VALUE er_error = rb_define_class("EssentiaRuby::EssentiaException", rb_eStandardError);
    rb_raise(er_error, "Essentia error.");
  }
}

%include "algorithm.h"
