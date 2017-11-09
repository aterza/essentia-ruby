#include <iostream>

#include "rice/Data_Type.hpp"
#include "rice/Data_Object.hpp"
#include "rice/Constructor.hpp"
#include "rice/Hash.hpp"

#include "modules.hpp"
#include "exception.hpp"
#include "parameter.hpp"
#include "parameter_map.hpp"

namespace Rice
{
  namespace Essentia
  {
    ParameterMapProxy::ParameterMapProxy(Rice::Hash h)
    {
      // if Hash not empty, unwind it by adding all members
    }

    void
    ParameterMapProxy::add(const std::string& key, Rice::Object o)
    {
      essentia::Parameter *p = from_ruby<essentia::Parameter *>(o);

      essentia::ParameterMap::add(key, *p);
    }

    static Rice::Data_Type<ParameterMapProxy> rb_cParameterMap;

    static Rice::Object
    wrap_ParameterMap_operator_sqb(Rice::Object o, Rice::Object k)
    {
      ParameterMapProxy *pm = from_ruby<ParameterMapProxy *>(o);
      std::string key = from_ruby<std::string>(k);
      return to_ruby<essentia::Parameter>((*pm)[key]);
    }

    static int
    wrap_ParameterMap_size(Rice::Object o)
    {
       ParameterMapProxy *pm = from_ruby<ParameterMapProxy *>(o);
       return pm->size();
    }

    void
    install_parameter_maps()
    {
       RUBY_TRY
       {
         rb_cParameterMap =
           define_class_under<ParameterMapProxy>(essentia_module(), "ParameterMap")
           .define_constructor(Constructor<ParameterMapProxy, Rice::Hash>(), (Arg("maybe hash") = Rice::Hash()))
           .add_handler<essentia::EssentiaException>(handle_essentia_exception)
           .define_method("size", &wrap_ParameterMap_size)
           .define_method("add", &ParameterMapProxy::add)
           .define_method("[]", &wrap_ParameterMap_operator_sqb)
           ;
       }
       RUBY_CATCH
    }
  }
}
