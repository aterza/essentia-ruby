//
// SWIG farm for the Essentia::Standard module
//
%module "essentia::standard"
%{
  #include  "config.h"
  #include "essentia.h"
%}

// %include std_vector.i
// %include typemaps.i
%import(module="essentia") "config.h";

%import(module="essentia") "essentia/parameter.i";
%import(module="essentia::standard") "iotypewrappers.h";

// %include "essentia/standard/iotypewrappers.i"
%include "essentia/standard/algorithm.i"
%include "essentia/standard/algorithm_factory.i"
