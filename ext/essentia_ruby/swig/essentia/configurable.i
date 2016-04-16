//
// SWIG Wrapper for essentia's Configurable class
//
%module essentia_ruby
%{
  #include "parameter.h"
  #include "types.h"
  #include "configurable.h"
%}
%include "configurable.h"

namespace essentia {
  class Configurable;
}
