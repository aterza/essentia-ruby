#if !defined(_RICE_ESSENTIA_PARAMETER_HPP_)
# define _RICE_ESSENTIA_PARAMETER_HPP_

#include <essentia/parameter.h>

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
    };

    void install_parameters();
  }
}

#endif /* !defined(_RICE_ESSENTIA_PARAMETER_HPP_) */
