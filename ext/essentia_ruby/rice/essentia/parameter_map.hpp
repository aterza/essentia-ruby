#if !defined(_RICE_ESSENTIA_PARAMETER_MAP_HPP_)
#  define _RICE_ESSENTIA_PARAMETER_MAP_HPP_

#include <essentia/parameter.h>

namespace Rice
{
  namespace Essentia
  {

    class ParameterMapProxy : public essentia::ParameterMap
    {
      essentia::Parameter *prepare_to_add(Rice::Object);

      public:

      ParameterMapProxy(Rice::Hash = Rice::Hash());

      void add(const std::string&, const Rice::Object);
    };

    void install_parameter_maps();
  }
}

#endif /* !defined(_RICE_ESSENTIA_PARAMETER_MAP_HPP_) */
