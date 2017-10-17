#if !defined(_RICE_ESSENTIA_TO_FROM_RUBY_HPP_)
# define _RICE_ESSENTIA_TO_FROM_RUBY_HPP_

#include <essentia/types.h>

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

      static std::vector<T> &
      convert(Rice::Object x)
      {
        Rice::Array a(x);
        Retval_T *result = new Retval_T;
        result->reserve(a.size());
        for (Rice::Array::iterator cur = a.begin(); cur != a.end(); ++cur)
        {
          result->push_back(from_ruby<T>(*cur));
        }
        return *result;
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

  //
  // this is needed to be able to dereference void pointers
  struct void_masker {};

}

// function prototypes

template<> Rice::void_masker *from_ruby<Rice::void_masker *>(Rice::Object);
template<> Rice::Object to_ruby<Rice::void_masker *>(Rice::void_masker *const &);

template<> essentia::Real *from_ruby<essentia::Real *>(Rice::Object);
template<> bool *from_ruby<bool *>(Rice::Object);
template<> int *from_ruby<int *>(Rice::Object);
template<> double *from_ruby<double *>(Rice::Object);
template<> uint *from_ruby<uint *>(Rice::Object);

template<> essentia::StereoSample *from_ruby<essentia::StereoSample *>(Rice::Object);
template<> Rice::Object to_ruby<essentia::StereoSample>(essentia::StereoSample const &);

template<> Rice::detail::from_ruby_<std::vector<essentia::Real> >::Retval_T *from_ruby<std::vector<essentia::Real> *>(Rice::Object);
template<> Rice::Object to_ruby<std::vector<essentia::Real> const &>(std::vector<essentia::Real> const &);

template<> Rice::detail::from_ruby_<std::vector<std::string> >::Retval_T *from_ruby<std::vector<std::string> *>(Rice::Object);
template<> Rice::Object to_ruby<std::vector<std::string> const &>(std::vector<std::string> const &);

template<> Rice::detail::from_ruby_<std::vector<bool> >::Retval_T *from_ruby<std::vector<bool> *>(Rice::Object);
template<> Rice::Object to_ruby<std::vector<bool> const &>(std::vector<bool> const &);

template<> Rice::detail::from_ruby_<std::vector<int> >::Retval_T *from_ruby<std::vector<int> *>(Rice::Object);
template<> Rice::Object to_ruby<std::vector<int> const &>(std::vector<int> const &);

#if 0
template<> Rice::Object to_ruby<essentia::Real>(const essentia::Real&);
#endif

#if 0
template<> std::type_info& from_ruby<std::type_info &>(Rice::Object);
template<> Rice::Object to_ruby<std::type_info>(const std::type_info &);

template<> Rice::detail::from_ruby_<std::vector<std::string> >::Retval_T from_ruby<std::vector<std::string> >(Rice::Object);
template<> Rice::Object to_ruby<std::vector<std::string> const &>(std::vector<std::string> const &);

template<> Rice::detail::from_ruby_<std::vector<essentia::Real> *>::Retval_T from_ruby<std::vector<essentia::Real> *>(Rice::Object);
template<> Rice::Object to_ruby<std::vector<essentia::Real> const &>(std::vector<essentia::Real> const &);
#endif
#endif /* !defined(_RICE_ESSENTIA_TO_FROM_RUBY_HPP_) */
