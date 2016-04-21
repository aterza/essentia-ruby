//
// SWIG Wrapper for essentia's types
//
%{
  #include "types.h"
%}

%include std_except.i
%include std_string.i
%include std_vector.i
%include std_pair.i

%rename(CaseInsensitiveStrCmp) case_insensitive_str_cmp;

%include "config.h"
%include "types.h"

%template(AnyVector) std::vector<swig::GC_VALUE>;
%template(RealVector) std::vector<essentia::Real>;
%template(StringVector) std::vector<std::string>;

namespace essentia {
  %extend EssentiaMap<std::string, std::string, string_cmp> {

     std::string __getitem__(const std::string& key)
     {
       return (*$self)[key];
     }

     void insert_hash(const std::vector<std::string> keys, const std::vector<std::string> values)
     {
       int size = keys.size();
       for(int i = 0; i < size; ++i)
         $self->insert(keys[i], values[i]);
     }
  }

  //%typemap(in) EssentiaMap<std::string, std::string, string_cmp> (const std::string& key, const std::string& value)
  //           (VALUE keys_arr, 

  %template(DescriptionMap) EssentiaMap<std::string, std::string, string_cmp>;
}
