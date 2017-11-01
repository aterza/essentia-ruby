#include <rice/Constructor.hpp>

#include "exception.hpp"
#include "modules.hpp"
#include "types.hpp"

namespace Rice {
  namespace Essentia {

    static Rice::Data_Type<essentia::TypeProxy> type_info_type;
    typedef void (TypeProxyProxy::*check_type_ptr)(const std::type_info&, const std::type_info&) const;

    static void
    install_type_info()
    {
      RUBY_TRY
      {
        type_info_type =
          define_class_under<essentia::TypeProxy>(essentia_module(), "TypeProxy")
          .define_director<TypeProxyProxy>()
          .define_constructor(Rice::Constructor<TypeProxyProxy, Rice::Object, const std::string&>(), (Arg("self"), Arg("name") = (std::string) "undefined"))
          .add_handler<essentia::EssentiaException>(handle_essentia_exception)
          .define_method("name", &TypeProxyProxy::name)
          .define_method("set_name", &TypeProxyProxy::setName)
          .define_method("check_type", check_type_ptr(&TypeProxyProxy::checkType))
          .define_method("check_same_type_as", &TypeProxyProxy::checkSameTypeAs)
          .define_method("check_same_vector_type_as", &TypeProxyProxy::checkVectorSameTypeAs)
          /*
           * These following two methods cannot be implemented currently, or
           * at least until I (or somebody) figures out the way to do it
           *
          .define_method("type_info", &TypeProxyProxy::default_typeInfo)
          .define_method("vector_type_info", &TypeProxyProxy::default_vectorTypeInfo)
          */
          ;
      }
      RUBY_CATCH
    }

    void install_essentia_types()
    {
       install_type_info();
    }
  }
}
