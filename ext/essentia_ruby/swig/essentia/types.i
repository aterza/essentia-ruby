//
// SWIG Wrapper for essentia's types
//
%{
  #include <stdio.h>
  #include "types.h"
  #include "real_number.h"
%}

%include std_except.i
%include std_string.i
%include std_vector.i
%include std_pair.i

%rename(CaseInsensitiveStrCmp) case_insensitive_str_cmp;

%include "config.h"
%include "types.h"
%include "real_number.h"

%template(AnyVector) std::vector<swig::GC_VALUE>;
%template(RealVector) std::vector<essentia::Real>;
%template(StringVector) std::vector<std::string>;

namespace essentia {
  %extend EssentiaMap<std::string, std::string, string_cmp> {

     std::string __getitem__(const std::string& key)
     {
       return (*$self)[key];
     }

     void insert_hash_of_strings(const std::vector<std::string>& keys, const std::vector<std::string>& values)
     {
       int size = keys.size();
       for(int i = 0; i < size; ++i)
       {
         // Check_Type(values[i], T_STRING); // raise the TypeError exception
         $self->insert(keys[i], values[i]);
       }
     }
     
     void insert_hash_of_ints(const std::vector<std::string>& keys, const int *values)
     {
       int size = keys.size();
       for(int i = 0; i < size; ++i)
       {
         Check_Type(values[i], T_FIXNUM); // raise the TypeError exception
         char *str = (char *) malloc(sizeof(int)*8+1); // this is a brutal hack
         sprintf(str, "%d", values[i]);
         $self->insert(keys[i], str);
       }
     }
  }

  %template(DescriptionMap) EssentiaMap<std::string, std::string, string_cmp>;
  //
  // typemap for hashes composed of int values
  //
  %typemap(directorin) EssentiaMap<std::string, std::string, string_cmp> (const std::string& keys, const int *values)
             (VALUE keys_arr, int i, std::string *key, std::string *val)
  {
    Check_Type($input, T_HASH);
    $1 = NUM2INT(rb_funcall($input, rb_intern("size"), 0, NULL));
    $2 = NULL;
    $3 = NULL;
    if ($1 > 0)
    {
      $2 = (char **) malloc($1*sizeof(char *));
      $3 = (char **) malloc($1*sizeof(int *));
      keys_arr = rb_funcall($input, rb_intern("keys"), 0, NULL);
      for (i = 0; i < $1; ++i)
      {
        key = rb_ary_entry(keys_arr, i);
        val = rb_hash_aref($input, key);
        Check_Type(key, T_STRING);
        Check_Type(val, T_FIXNUM);
        $2[i] = StringValuePtr(key);
        $3[i] = NUM2INT(val);
      }
    }
  }

  %typemap(freearg) (int nattributes, const char **names, const char **values)
  {
    free((void *) $2);
    free((void *) $3);
  }

}
