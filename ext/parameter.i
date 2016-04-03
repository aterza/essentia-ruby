//
// SWIG Wrapper for essentia's Parameter class
//
%module essentia_ruby
%{
  #include "parameter.h"
%}

%include std_vector.i
%include "types.h"
%include "parameter.h"
