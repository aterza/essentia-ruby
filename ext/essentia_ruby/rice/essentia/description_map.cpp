#include "rice/Data_Type.hpp"
#include "rice/Data_Object.hpp"
#include "rice/Constructor.hpp"
#include "rice/Hash.hpp"
#include "rice/ruby_try_catch.hpp"

#include <essentia/types.h>
#include "modules.hpp"
#include "exception.hpp"
#include "to_from_ruby.hpp"

namespace Rice {
    namespace Essentia {

    static Rice::Data_Type<essentia::DescriptionMap> description_map_type;

    static Rice::Object
    wrap_DescriptionMap_insert(Rice::Object o, const Rice::Object k, const Rice::Object v)
    {
       essentia::DescriptionMap *dm = from_ruby<essentia::DescriptionMap *>(o);
       std::string key = from_ruby<std::string>(k);
       std::string value = from_ruby<std::string>(v);
       dm->insert(key, value);
       return o;
    }

    static Rice::Object
    wrap_DescriptionMap_keys(Rice::Object o)
    {
       essentia::DescriptionMap *dm = from_ruby<essentia::DescriptionMap *>(o);
       Rice::Object result = to_ruby<std::vector<std::string> >(dm->keys());
       return result;
    }

    static Rice::Object
    wrap_DescriptionMap_operator_sqb(Rice::Object o, Rice::Object k)
    {
       essentia::DescriptionMap *dm = from_ruby<essentia::DescriptionMap *>(o);
       const std::string key = from_ruby<std::string>(k);
       std::string value = (*dm)[key];
       Rice::Object result = to_ruby<std::string>(value);
       return result;
    }

    static Rice::Object
    wrap_DescriptionMap_size(Rice::Object o)
    {
       essentia::DescriptionMap *dm = from_ruby<essentia::DescriptionMap *>(o);
       Rice::Object result = to_ruby(dm->size());
       return result;
    }

    static Rice::Object
    wrap_DescriptionMap_count(Rice::Object o, Rice::Object k)
    {
       essentia::DescriptionMap *dm = from_ruby<essentia::DescriptionMap *>(o);
       const std::string key = from_ruby<std::string>(k);
       Rice::Object result = to_ruby(dm->count(key));
       return result;
    }

    void
    install_description_maps()
    {
       RUBY_TRY
       {
         description_map_type =
            define_class_under<essentia::DescriptionMap>(essentia_module(), "DescriptionMap")
           .define_constructor(Constructor<essentia::DescriptionMap>())
           .add_handler<essentia::EssentiaException>(handle_essentia_exception)
           .define_method("keys", &wrap_DescriptionMap_keys)
           .define_method("size", &wrap_DescriptionMap_size)
           .define_method("count", &wrap_DescriptionMap_count)
           .define_method("[]", &wrap_DescriptionMap_operator_sqb)
           .define_method("insert", &wrap_DescriptionMap_insert);
       }
       RUBY_CATCH
    }

    }
}
