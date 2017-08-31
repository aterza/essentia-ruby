//
// SWIG farm for the Essentia module
//
%module essentia
%{
  #include  "config.h"
  #include "essentia.h"
%}

%include "essentia/essentia.i"
%include "essentia/types.i"
%include "essentia/exception.i"
%include "essentia/essentiamath.i"
%include "essentia/threading.i"
%include "essentia/parameter.i"
%include "essentia/pool.i"
%include "essentia/configurable.i"
