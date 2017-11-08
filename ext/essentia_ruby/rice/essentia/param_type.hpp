#if !defined(_RICE_ESSENTIA_PARAM_TYPE_HPP_)
# define _RICE_ESSENTIA_PARAM_TYPE_HPP_

#include <rice/Enum.hpp>
#include <rice/Array.hpp>

#include <essentia/parameter.h>

namespace Rice
{
  namespace Essentia
  {
    inline bool is_it_a(Rice::Object o, ruby_value_type t) { return o.rb_type() == t; }
    bool is_it_a_stereo_sample(Rice::Object o);
    bool is_it_an_array_of(Rice::Object, ruby_value_type, ruby_value_type = RUBY_T_NONE);
    bool is_it_an_array_of_stereo_samples(Rice::Object);
    essentia::Parameter::ParamType to_param_type(Rice::Object, ruby_value_type, essentia::Parameter::ParamType);
  }
} 

#endif /* !defined(_RICE_ESSENTIA_PARAM_TYPE_HPP_) */
