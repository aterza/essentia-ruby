#include "rice/Data_Type.hpp"
#include "rice/Data_Object.hpp"
#include "rice/Constructor.hpp"
#include "rice/Array.hpp"
#include "rice/Enum.hpp"
#include "rice/to_from_ruby.hpp"
#include "rice/ruby_try_catch.hpp"

#include <essentia/types.h>
#include "modules.hpp"
#include "exception.hpp"
#include "to_from_ruby.hpp"
#include "parameter.hpp"

namespace Rice {
  namespace Essentia {

    static Rice::Enum<essentia::Parameter::ParamType> parameter_type_type;

    static void
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

    static Rice::Data_Type<essentia::Parameter> parameter_type;
    static Rice::Data_Type<Rice::Essentia::ParameterBase> parameter_base_type;

    void
    install_parameters()
    {
      RUBY_TRY
      {
        install_parameter_type();

        parameter_type =
          define_class_under<essentia::Parameter>(essentia_module(), "Parameter__")
          .add_handler<essentia::EssentiaException>(handle_essentia_exception)
          ;

        parameter_base_type =
          define_class_under<Rice::Essentia::ParameterBase, essentia::Parameter>(essentia_module(), "ParameterBase")
          .define_constructor(Constructor<Rice::Essentia::ParameterBase, essentia::Parameter::ParamType&>())
          .add_handler<essentia::EssentiaException>(handle_essentia_exception)
          .define_method("clear", &Rice::Essentia::ParameterBase::clear)
          .define_method("assign", &Rice::Essentia::ParameterBase::operator=)
          .define_method("==", &Rice::Essentia::ParameterBase::operator==)
          .define_method("!=", &Rice::Essentia::ParameterBase::operator!=)
          .define_method("type", &Rice::Essentia::ParameterBase::type)
          .define_method("is_configured?", &Rice::Essentia::ParameterBase::isConfigured)
          .define_method("to_s", &Rice::Essentia::ParameterBase::toString)
          .define_method("downcase", &Rice::Essentia::ParameterBase::toLower)
          .define_method("to_boolean", &Rice::Essentia::ParameterBase::toBool)
          .define_method("to_double", &Rice::Essentia::ParameterBase::toDouble)
          .define_method("to_f", &Rice::Essentia::ParameterBase::toFloat)
          .define_method("to_stereo_sample", &Rice::Essentia::ParameterBase::toStereoSample)
          .define_method("to_i", &Rice::Essentia::ParameterBase::toInt)
          .define_method("to_real", &Rice::Essentia::ParameterBase::toReal)
          .define_method("to_vector_real", &Rice::Essentia::ParameterBase::toVectorReal)
          .define_method("to_vector_string", &Rice::Essentia::ParameterBase::toVectorString)
          .define_method("to_vector_int", &Rice::Essentia::ParameterBase::toVectorInt)
          .define_method("to_vector_boolean", &Rice::Essentia::ParameterBase::toVectorBool)
          .define_method("to_vector_stereo_sample", &Rice::Essentia::ParameterBase::toVectorStereoSample)
          .define_method("to_vector_vector_real", &Rice::Essentia::ParameterBase::toVectorVectorReal)
          .define_method("to_vector_vector_string", &Rice::Essentia::ParameterBase::toVectorVectorString)
          .define_method("to_vector_vector_stereo_sample", &Rice::Essentia::ParameterBase::toVectorVectorStereoSample)
          .define_method("to_vector_matrix_real", &Rice::Essentia::ParameterBase::toVectorMatrixReal)
          .define_method("to_map_vector_real", &Rice::Essentia::ParameterBase::toMapVectorReal)
          .define_method("to_map_vector_string", &Rice::Essentia::ParameterBase::toMapVectorString)
          .define_method("to_map_real", &Rice::Essentia::ParameterBase::toMapReal)
          .define_method("to_matrix_real", &Rice::Essentia::ParameterBase::toMatrixReal)
          ;
      }
      RUBY_CATCH
    }

  }
}
