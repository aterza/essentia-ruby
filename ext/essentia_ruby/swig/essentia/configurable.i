//
// SWIG Wrapper for essentia's Configurable class
//
%{
  #include "parameter.h"
  #include "types.h"
  #include "configurable.h"
%}
%include "configurable.h"

namespace essentia {
  class Configurable;
}
