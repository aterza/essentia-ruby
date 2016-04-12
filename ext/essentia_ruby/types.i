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

%include "config.h"
%include "types.h"

// %template(binary_functionSSB) std::binary_function<std::string const &, std::string const &, bool>;
// %template(mapSScmp) std::map<std::string, std::string, std::less<std::string>>;

namespace essentia {
%alias case_insensitive_str_cmp  "CaseInsensitiveStrCmp";
%template(EssentiaMapSSScmp) EssentiaMap<std::string, std::string, string_cmp>;
typedef DescriptionMap EssentiaMapSSScmp;
class TypeProxy;
}
