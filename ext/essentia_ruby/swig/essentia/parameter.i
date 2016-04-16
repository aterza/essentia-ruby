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

namespace std {
  %template(ParameterVector) vector<essentia::Parameter *>;
}

namespace essentia {
  %extend ParameterMap {
    const Parameter& __getitem__(const ::std::string key) const { return (*self)[key]; }
  }
}
