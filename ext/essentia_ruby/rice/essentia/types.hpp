#if !defined(_RICE_ESSENTIA_TYPES_HPP_)
#  define _RICE_ESSENTIA_TYPES_HPP_

#include "rice/Director.hpp"

#include "to_from_ruby.hpp"

#include <essentia/types.h>

namespace Rice {
  namespace Essentia {

    class std_type_info_proxy : public std::type_info
    {
      public:

      std_type_info_proxy(const char *n) : std::type_info(n) {}
    };

    static std_type_info_proxy null_type_info("undefined");

    class TypeProxyProxy : public essentia::TypeProxy, public Rice::Director
    {
      public:

      TypeProxyProxy(Rice::Object self, const std::string& name = "undefined") : essentia::TypeProxy(name), Rice::Director(self) {}

      virtual const std::type_info& typeInfo() const
      {
        return from_ruby<std::type_info &>(getSelf().call("type_info"));
      }

      const std::type_info& default_typeInfo() const
      {
        raisePureVirtual();
        return null_type_info;
      }

      virtual const std::type_info& vectorTypeInfo() const
      {
        return from_ruby<std::type_info &>(getSelf().call("vector_type_info"));
      }

      const std::type_info& default_vectorTypeInfo() const
      {
        raisePureVirtual();
        return null_type_info;
      }
    };

    void install_essentia_types();

  }
}

#endif /* !defined(_RICE_ESSENTIA_TYPES_HPP_) */
