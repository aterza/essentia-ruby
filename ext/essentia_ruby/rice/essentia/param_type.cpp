#include "modules.hpp"
#include "param_type.hpp"

namespace Rice
{
  namespace Essentia
  {
    static Rice::Enum<essentia::Parameter::ParamType> parameter_type_type;

    void
    install_parameter_type()
    {
      parameter_type_type =
        define_enum<essentia::Parameter::ParamType>("ParamType", essentia_module())
        .define_value("UNDEFINED", essentia::Parameter::ParamType::UNDEFINED)
        .define_value("REAL", essentia::Parameter::ParamType::REAL)
        .define_value("STRING", essentia::Parameter::ParamType::STRING)
        .define_value("BOOL", essentia::Parameter::ParamType::BOOL)
        .define_value("INT", essentia::Parameter::ParamType::INT)
        .define_value("STEREOSAMPLE", essentia::Parameter::ParamType::STEREOSAMPLE)
        .define_value("VECTOR_REAL", essentia::Parameter::ParamType::VECTOR_REAL)
        .define_value("VECTOR_STRING", essentia::Parameter::ParamType::VECTOR_STRING)
        .define_value("VECTOR_BOOL", essentia::Parameter::ParamType::VECTOR_BOOL)
        .define_value("VECTOR_INT", essentia::Parameter::ParamType::VECTOR_INT)
        .define_value("VECTOR_STEREOSAMPLE", essentia::Parameter::ParamType::VECTOR_STEREOSAMPLE)
        .define_value("VECTOR_VECTOR_REAL", essentia::Parameter::ParamType::VECTOR_VECTOR_REAL)
        .define_value("VECTOR_VECTOR_STRING", essentia::Parameter::ParamType::VECTOR_VECTOR_STRING)
        .define_value("VECTOR_VECTOR_STEREOSAMPLE", essentia::Parameter::ParamType::VECTOR_VECTOR_STEREOSAMPLE)
        .define_value("VECTOR_MATRIX_REAL", essentia::Parameter::ParamType::VECTOR_MATRIX_REAL)
        .define_value("MAP_VECTOR_REAL", essentia::Parameter::ParamType::MAP_VECTOR_REAL)
        .define_value("MAP_VECTOR_STRING", essentia::Parameter::ParamType::MAP_VECTOR_STRING)
        .define_value("MAP_VECTOR_INT", essentia::Parameter::ParamType::MAP_VECTOR_INT)
        .define_value("MAP_REAL", essentia::Parameter::ParamType::MAP_REAL)
        .define_value("MATRIX_REAL", essentia::Parameter::ParamType::MATRIX_REAL)
        ;
    }

    essentia::Parameter::ParamType
    to_param_type(Rice::Object o, ruby_value_type rt, essentia::Parameter::ParamType pt)
    {
       return is_it_a(o, rt) ? pt : essentia::Parameter::ParamType::UNDEFINED;
    }

    bool
    is_it_a_stereo_sample(Rice::Object o)
    {
      bool result = false;

      if (is_it_a(o, RUBY_T_ARRAY))
      {
        Array a(o);
        result = ((a.size() == 2) && (is_it_a(a[0], RUBY_T_FLOAT) && is_it_a(a[1], RUBY_T_FLOAT)));
      }

      return result;
    }

    static const int max_size_check = 10;

    bool
    is_it_an_array_of(Rice::Object o, ruby_value_type rt, ruby_value_type ort)
    {
      bool result = false;
      Array a(o);
      int sz = a.size() > max_size_check ? max_size_check : a.size();

      for(int i = 0; i < sz; ++i)
      {
        if (ort == RUBY_T_NONE)
          result = is_it_a(a[i], rt);
        else
          result = is_it_a(a[i], rt) || is_it_a(a[i], ort);

        if (!result)
                break;
      }

      return result;
    }

    bool
    is_it_an_array_of_stereo_samples(Rice::Object o)
    {
      bool result = false;
      Array a(o);
      int sz = a.size() > max_size_check ? max_size_check : a.size();

      for(int i = 0; i < sz; ++i)
      {
        result = is_it_a_stereo_sample(a[i]);
        if (!result)
                break;
      }

      return result;
    }
  }
}
