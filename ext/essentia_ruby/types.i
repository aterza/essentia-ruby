//
// SWIG Wrapper for essentia's types
//
%module essentia_ruby
%{
  #include "types.h"
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
