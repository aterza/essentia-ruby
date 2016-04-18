//
// SWIG Wrapper for essentia's types
//
%{
  #include "types.h"
  std::vector<swig::GC_VALUE> NArray;
  std::vector<essentia::Real> RArray;
%}

%include std_except.i
%include std_string.i
%include std_vector.i

%rename(CaseInsensitiveStrCmp) case_insensitive_str_cmp;

%include "config.h"
%include "types.h"

namespace essentia {
  %template(DescriptionMap) EssentiaMap<std::string, std::string, string_cmp>;
}

%typemap(in) std::vector<essentia::Real> {
}

%template(NArray) std::vector<swig::GC_VALUE>;
%template(RArray) std::vector<essentia::Real>;
