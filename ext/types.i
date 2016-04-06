//
// SWIG Wrapper for essentia's types
//
%module essentia_ruby
%{
  #include "types.h"
%}

%include std_string.i
%include std_vector.i

%include "config.h"
// %include "types.h"
