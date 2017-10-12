#if !defined(_RICE_ESSENTIA_PARAMETER_HPP_)
# define _RICE_ESSENTIA_PARAMETER_HPP_

#include <essentia/parameter.h>

#include "to_from_ruby.hpp"

namespace Rice
{
  namespace Essentia
  {
    //
    // this class is to simplify construction methods
    //
    class ParameterBase : public essentia::Parameter
    {
      public:

        ParameterBase(essentia::Parameter::ParamType pt) : essentia::Parameter(pt) {}

        ParameterBase & operator=(const ParameterBase& p)
        {
          return (ParameterBase&) essentia::Parameter::operator=(p);
        }

        // sequence of ParameterBase constructors
        ParameterBase(const std::string &s) : essentia::Parameter(s) {}
        ParameterBase(const essentia::Real &r) : essentia::Parameter(r) {}
    };

    class StringParameter : public ParameterBase
    {
      public:

        StringParameter(const std::string &s) : ParameterBase(s) {}
    };

    class RealParameter : public ParameterBase
    {
      public:

        RealParameter(const essentia::Real &r) : ParameterBase(r) {}
    };

    class BoolParameter : public ParameterBase
    {
      public:

        BoolParameter(const bool &b) : ParameterBase(b) {}
    };

    void install_parameters();
  }
}

#endif /* !defined(_RICE_ESSENTIA_PARAMETER_HPP_) */
