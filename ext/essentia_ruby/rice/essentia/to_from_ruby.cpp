#include <iostream>

#include "essentia/types.h"
#include "to_from_ruby.hpp"

  // void * specialization
  // a real specialization to a <void *> type cannot be done, so we
  // hack it by inventing an empty struct void_masker with which we do
  // specialize the pointer
  // The <void *> function pointer should be cast to that struct
  // in the calls that go from and to ruby
  //
template <Rice::void_masker *>
Rice::void_masker *
from_ruby(Rice::Object x)
{
  return (Rice::void_masker *) x.value();
}

template <Rice::void_masker *>
Rice::Object
to_ruby(Rice::void_masker *const &p)
{
  Rice::Object result((VALUE) p);

  return result;
}

template <>
essentia::Real *
from_ruby<essentia::Real *>(Rice::Object o)
{
   essentia::Real *r = new essentia::Real;
   double d;
   Rice::protect(Rice::detail::num2dbl, o, &d);
   *r = (essentia::Real) d;
   return r;
}

template <>
bool *
from_ruby<bool *>(Rice::Object o)
{
  return (bool *) &o.value();
}

template <>
int *
from_ruby<int *>(Rice::Object i)
{
  int *p = new int;
  *p = from_ruby<int>(i);
  return p;
}

template <>
double *
from_ruby<double *>(Rice::Object d)
{
  double *p = new double;
  Rice::protect(Rice::detail::num2dbl, d, p);
  return p;
}

template <>
unsigned int *
from_ruby<unsigned int *>(Rice::Object u)
{
  unsigned int *p = new unsigned int;

  *p = from_ruby<unsigned int>(u);
  return p;
}

template <>
essentia::StereoSample *
from_ruby<essentia::StereoSample *>(Rice::Object o)
{
  Rice::Array ss(o);
  essentia::StereoSample *result = new essentia::StereoSample;

  result->first = from_ruby<essentia::Real>(ss[0]);
  result->second = from_ruby<essentia::Real>(ss[1]);

  return result;
}

template <>
essentia::StereoSample 
from_ruby<essentia::StereoSample>(Rice::Object o)
{
  return *(from_ruby<essentia::StereoSample *>(o));
}

template <>
Rice::Object
to_ruby<essentia::StereoSample>(essentia::StereoSample const & ss)
{
  Rice::Array a;

  a.push(ss.left());
  a.push(ss.right());

  return a;
}

template <>
Rice::detail::from_ruby_<std::vector<essentia::Real> >::Retval_T *
from_ruby<std::vector<essentia::Real> *>(Rice::Object x)
{
   return &(Rice::detail::from_ruby_<std::vector<essentia::Real> >::convert(x));
}

template <>
Rice::detail::from_ruby_<std::vector<std::string> >::Retval_T *
from_ruby<std::vector<std::string> *>(Rice::Object x)
{
   return &(Rice::detail::from_ruby_<std::vector<std::string> >::convert(x));
}

template <>
Rice::detail::from_ruby_<std::vector<bool> >::Retval_T *
from_ruby<std::vector<bool> *>(Rice::Object x)
{
   return &(Rice::detail::from_ruby_<std::vector<bool> >::convert(x));
}

template <>
Rice::detail::from_ruby_<std::vector<int> >::Retval_T *
from_ruby<std::vector<int> *>(Rice::Object x)
{
   return &(Rice::detail::from_ruby_<std::vector<int> >::convert(x));
}

template <>
Rice::detail::from_ruby_<std::vector<essentia::StereoSample> >::Retval_T *
from_ruby<std::vector<essentia::StereoSample> *>(Rice::Object x)
{
   return &(Rice::detail::from_ruby_<std::vector<essentia::StereoSample> >::convert(x));
}
