//
// SWIG farm for the Essentia module
//
%module "essentia::scheduler"
%{
  #include  "config.h"
  #include "essentia.h"
%}

%include std_vector.i

%include "essentia/scheduler/network.i"
