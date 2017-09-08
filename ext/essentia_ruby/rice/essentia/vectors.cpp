#include "essentia/types.h"
#include "vectors.hpp"

namespace Rice {

  // specializations
  // put here all the specializations needed following the canvas provided
  // below

  //
  // vectors of strings
  //
  template <std::vector<std::string> *>
  typename Rice::detail::from_ruby_<std::vector<std::string> *>::Retval_T
  from_ruby(Rice::Object x)
  {
     return Rice::detail::from_ruby_<std::vector<std::string> *>::convert(x);
  }

  template<std::vector<std::string> const &>
  Rice::Object
  to_ruby(std::vector<std::string> const &aa)
  {
    return Rice::detail::to_ruby_<std::vector<std::string> const &>::convert(aa);
  }

  //
  // vectors of real numbers (samples)
  //
  template <std::vector<essentia::Real> *>
  typename Rice::detail::from_ruby_<std::vector<essentia::Real> *>::Retval_T
  from_ruby(Rice::Object x)
  {
     return Rice::detail::from_ruby_<std::vector<essentia::Real> *>::convert(x);
  }

  template<std::vector<essentia::Real> const &>
  Rice::Object
  to_ruby(std::vector<essentia::Real> const &aa)
  {
    return Rice::detail::to_ruby_<std::vector<essentia::Real> const &>::convert(aa);
  }

}
