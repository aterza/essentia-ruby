#include "rice/Data_Type.hpp"
#include "rice/Data_Object.hpp"
#include "rice/Constructor.hpp"
#include "rice/Hash.hpp"

#include "modules.hpp"
#include "exception.hpp"
#include "to_from_ruby.hpp"
#include "parameter.hpp"

namespace Rice
{
  namespace Essentia
  {
    static Rice::Data_Type<essentia::ParameterMap> parameter_map_type;

    static Rice::Object
    wrap_ParameterMap_operator_sqb(Rice::Object o, Rice::Object k)
    {
      essentia::ParameterMap *pm = from_ruby<essentia::ParameterMap *>(o);
      std::string key = from_ruby<std::string>(k);
      Rice::Essentia::ParameterBase *pb = (Rice::Essentia::ParameterBase *) &((*pm)[key]);
      return pb->value();
    }

    static int
    wrap_ParameterMap_size(Rice::Object o)
    {
       essentia::ParameterMap *pm = from_ruby<essentia::ParameterMap *>(o);
       return pm->size();
    }

    void
    install_parameter_maps()
    {
       RUBY_TRY
       {
         parameter_map_type =
           define_class_under<essentia::ParameterMap>(essentia_module(), "ParameterMap")
           .define_constructor(Constructor<essentia::ParameterMap>())
           .add_handler<essentia::EssentiaException>(handle_essentia_exception)
           .define_method("size", &wrap_ParameterMap_size)
           .define_method("add", &essentia::ParameterMap::add)
           .define_method("[]", &wrap_ParameterMap_operator_sqb)
           ;
       }
       RUBY_CATCH
    }
  }
}
