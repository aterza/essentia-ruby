#if !defined(_RICE_ESSENTIA_VECTORS_HPP_)
# define _RICE_ESSENTIA_VECTORS_HPP_

// This is the file where we keep all the from_ruby/to_ruby specializations
// which happen within Essentia. It was picked up directly from
//
// https://github.com/jasonroelofs/rice/wiki/FAQ
//
// and then further extended and modified.
//
// Not an official example; there may be a better way. Tested in rice 1.4.0.
//
#include <rice/Object.hpp>
#include <rice/Array.hpp>
#include <rice/to_from_ruby.hpp>

namespace Rice
{

  namespace detail
  {

    template<typename T>
    struct from_ruby_<std::vector<T> > 
    {
      typedef std::vector<T> Retval_T;

      static std::vector<T>
      convert(Rice::Object x)
      {
        Rice::Array a(x);
        std::vector<T> result;
        result.reserve(a.size());
        for (Rice::Array::iterator cur = a.begin(); cur != a.end(); ++cur)
        {
          result.push_back(from_ruby<T>(*cur));
        }
        return result;
      }
    };

    template<typename T>
    struct to_ruby_<std::vector<T> > 
    {
      static Rice::Object
      convert(std::vector<T> const & x)
      {
        return Rice::Array(x.begin(), x.end());
      }
    };

  } // namespace detail

}

#endif /* !defined(_RICE_ESSENTIA_VECTORS_HPP_) */
