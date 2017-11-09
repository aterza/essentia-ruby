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
#include "param_type.hpp"

namespace Rice {
  namespace Essentia {

    template <typename T>
    Rice::Object
    ParameterBase::create_ruby_parameter(essentia::Parameter const &p)
    {
      return to_ruby<T>((T const &) p);
    }

    Rice::Object
    ParameterBase::value() const
    {
      Rice::Object null_value;
      return null_value;
    }

    static Rice::Data_Type<essentia::Parameter> rb_cParameter;
    static Rice::Data_Type<Rice::Essentia::ParameterBase> rb_cParameterBase;

    static void install_specialized_parameters();

    void
    install_parameters()
    {
      RUBY_TRY
      {
        void install_parameter_type();

        install_parameter_type();

        rb_cParameter =
          define_class_under<essentia::Parameter>(essentia_module(), "Parameter__")
          .add_handler<essentia::EssentiaException>(handle_essentia_exception)
          ;

        rb_cParameterBase =
          define_class_under<Rice::Essentia::ParameterBase, essentia::Parameter>(essentia_module(), "ParameterBase")
          .define_constructor(Constructor<Rice::Essentia::ParameterBase, essentia::Parameter::ParamType&>())
          .add_handler<essentia::EssentiaException>(handle_essentia_exception)
          .define_method("clear", &Rice::Essentia::ParameterBase::clear)
          .define_method("assign", &Rice::Essentia::ParameterBase::operator=)
          .define_method("==", &Rice::Essentia::ParameterBase::operator==)
          .define_method("!=", &Rice::Essentia::ParameterBase::operator!=)
          .define_method("type", &Rice::Essentia::ParameterBase::type)
          .define_method("is_configured?", &Rice::Essentia::ParameterBase::isConfigured)
          .define_method("to_s", &Rice::Essentia::ParameterBase::toString, (Arg("precision") = 12))
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

        install_specialized_parameters();
      }
      RUBY_CATCH
    }

    static Rice::Data_Type<Rice::Essentia::StringParameter> rb_cStringParameter;
    static Rice::Data_Type<Rice::Essentia::RealParameter> rb_cRealParameter;
    static Rice::Data_Type<Rice::Essentia::BoolParameter> rb_cBoolParameter;
    static Rice::Data_Type<Rice::Essentia::IntParameter> rb_cIntParameter;
    static Rice::Data_Type<Rice::Essentia::DoubleParameter> double_parameter_type;
    static Rice::Data_Type<Rice::Essentia::UintParameter> uint_parameter_type;
    static Rice::Data_Type<Rice::Essentia::StereoSampleParameter> rb_cStereoSampleParameter;
    static Rice::Data_Type<Rice::Essentia::VectorRealParameter> rb_cVectorRealParameter;
    static Rice::Data_Type<Rice::Essentia::VectorStringParameter> rb_cVectorStringParameter;
    static Rice::Data_Type<Rice::Essentia::VectorBoolParameter> rb_cVectorBoolParameter;
    static Rice::Data_Type<Rice::Essentia::VectorIntParameter> rb_cVectorIntParameter;
    static Rice::Data_Type<Rice::Essentia::VectorStereoSampleParameter> rb_cVectorStereoSampleParameter;

    static void
    install_specialized_parameters()
    {
      RUBY_TRY
      {
        rb_cStringParameter =
          define_class_under<Rice::Essentia::StringParameter, Rice::Essentia::ParameterBase>(essentia_module(), "StringParameter")
          .define_constructor(Constructor<Rice::Essentia::StringParameter, const std::string&>())
          .add_handler<essentia::EssentiaException>(handle_essentia_exception)
          ;

        rb_cRealParameter =
          define_class_under<Rice::Essentia::RealParameter, Rice::Essentia::ParameterBase>(essentia_module(), "RealParameter")
          .define_constructor(Constructor<Rice::Essentia::RealParameter, const essentia::Real&>())
          .add_handler<essentia::EssentiaException>(handle_essentia_exception)
          ;

        rb_cBoolParameter =
          define_class_under<Rice::Essentia::BoolParameter, Rice::Essentia::ParameterBase>(essentia_module(), "BoolParameter")
          .define_constructor(Constructor<Rice::Essentia::BoolParameter, const bool&>())
          .add_handler<essentia::EssentiaException>(handle_essentia_exception)
          ;

        rb_cIntParameter =
          define_class_under<Rice::Essentia::IntParameter, Rice::Essentia::ParameterBase>(essentia_module(), "IntParameter")
          .define_constructor(Constructor<Rice::Essentia::IntParameter, const int&>())
          .add_handler<essentia::EssentiaException>(handle_essentia_exception)
          ;

        double_parameter_type =
          define_class_under<Rice::Essentia::DoubleParameter, Rice::Essentia::ParameterBase>(essentia_module(), "DoubleParameter")
          .define_constructor(Constructor<Rice::Essentia::DoubleParameter, const double&>())
          .add_handler<essentia::EssentiaException>(handle_essentia_exception)
          ;

        uint_parameter_type =
          define_class_under<Rice::Essentia::UintParameter, Rice::Essentia::ParameterBase>(essentia_module(), "UintParameter")
          .define_constructor(Constructor<Rice::Essentia::UintParameter, const uint&>())
          .add_handler<essentia::EssentiaException>(handle_essentia_exception)
          ;

        rb_cStereoSampleParameter =
          define_class_under<Rice::Essentia::StereoSampleParameter, Rice::Essentia::ParameterBase>(essentia_module(), "StereoSampleParameter")
          .define_constructor(Constructor<Rice::Essentia::StereoSampleParameter, const essentia::StereoSample&>())
          .add_handler<essentia::EssentiaException>(handle_essentia_exception)
          ;
        
        rb_cVectorRealParameter =
          define_class_under<Rice::Essentia::VectorRealParameter, Rice::Essentia::ParameterBase>(essentia_module(), "VectorRealParameter")
          .define_constructor(Constructor<Rice::Essentia::VectorRealParameter, const std::vector<essentia::Real>& >())
          .add_handler<essentia::EssentiaException>(handle_essentia_exception)
          ;
        
        rb_cVectorStringParameter =
          define_class_under<Rice::Essentia::VectorStringParameter, Rice::Essentia::ParameterBase>(essentia_module(), "VectorStringParameter")
          .define_constructor(Constructor<Rice::Essentia::VectorStringParameter, const std::vector<std::string>& >())
          .add_handler<essentia::EssentiaException>(handle_essentia_exception)
          ;

        rb_cVectorBoolParameter =
          define_class_under<Rice::Essentia::VectorBoolParameter, Rice::Essentia::ParameterBase>(essentia_module(), "VectorBoolParameter")
          .define_constructor(Constructor<Rice::Essentia::VectorBoolParameter, const std::vector<bool>& >())
          .add_handler<essentia::EssentiaException>(handle_essentia_exception)
          ;

        rb_cVectorIntParameter =
          define_class_under<Rice::Essentia::VectorIntParameter, Rice::Essentia::ParameterBase>(essentia_module(), "VectorIntParameter")
          .define_constructor(Constructor<Rice::Essentia::VectorIntParameter, const std::vector<int>& >())
          .add_handler<essentia::EssentiaException>(handle_essentia_exception)
          ;

        rb_cVectorStereoSampleParameter =
          define_class_under<Rice::Essentia::VectorStereoSampleParameter, Rice::Essentia::ParameterBase>(essentia_module(), "VectorStereoSampleParameter")
          .define_constructor(Constructor<Rice::Essentia::VectorStereoSampleParameter, const std::vector<essentia::StereoSample>& >())
          .add_handler<essentia::EssentiaException>(handle_essentia_exception)
          ;
      }
      RUBY_CATCH
    }

  }
}

//
// to/from ruby
//

template <>
Rice::Essentia::ParameterBase *
from_ruby<Rice::Essentia::ParameterBase *>(Rice::Object o)
{
  Rice::Essentia::ParameterBase *p = 0;

  if (o.is_a(Rice::Essentia::rb_cParameterBase))
  {
    Rice::Data_Object<Rice::Essentia::ParameterBase> ep(o.value());
    p = ep.get();
  }
  else
  {
    switch(o.rb_type())
    {
      case T_STRING:
        p = Rice::Essentia::ParameterBase::to_ParameterBase<Rice::Essentia::StringParameter, std::string>(o);
        break;
      case T_TRUE:
      case T_FALSE:
        p = Rice::Essentia::ParameterBase::to_ParameterBase<Rice::Essentia::BoolParameter, bool>(o);
        break;
      case T_FIXNUM:
        p = Rice::Essentia::ParameterBase::to_ParameterBase<Rice::Essentia::IntParameter, int>(o);
        break;
      case T_FLOAT:
        p = Rice::Essentia::ParameterBase::to_ParameterBase<Rice::Essentia::RealParameter, float>(o);
        break;
      case T_ARRAY:
        if (Rice::Essentia::is_it_a_stereo_sample(o))
          p = Rice::Essentia::ParameterBase::to_ParameterBase<Rice::Essentia::StereoSampleParameter, essentia::StereoSample>(o);
        else if (Rice::Essentia::is_it_an_array_of(o, RUBY_T_STRING))
          p = Rice::Essentia::ParameterBase::to_ParameterBase<Rice::Essentia::VectorStringParameter, std::vector<std::string> >(o);
        else if (Rice::Essentia::is_it_an_array_of(o, RUBY_T_FIXNUM))
          p = Rice::Essentia::ParameterBase::to_ParameterBase<Rice::Essentia::VectorIntParameter, std::vector<int> >(o);
        else if (Rice::Essentia::is_it_an_array_of(o, RUBY_T_FIXNUM, RUBY_T_FLOAT))
          p = Rice::Essentia::ParameterBase::to_ParameterBase<Rice::Essentia::VectorRealParameter, std::vector<essentia::Real> >(o);
        else if (Rice::Essentia::is_it_an_array_of(o, RUBY_T_TRUE, RUBY_T_FALSE))
          p = Rice::Essentia::ParameterBase::to_ParameterBase<Rice::Essentia::VectorBoolParameter, std::vector<bool> >(o);
        else if (Rice::Essentia::is_it_an_array_of_stereo_samples(o))
          p = Rice::Essentia::ParameterBase::to_ParameterBase<Rice::Essentia::VectorStereoSampleParameter, std::vector<essentia::StereoSample> >(o);
        else
          throw essentia::EssentiaException("Argument Error: unrecognized array parameter type");
        break;
      default:
        throw essentia::EssentiaException("Argument Error: unrecognized parameter type");
    }
  }

  return p;
}

template <>
Rice::Object
to_ruby<essentia::Parameter>(essentia::Parameter const& p)
{
  switch(p.type())
  {
    case essentia::Parameter::ParamType::INT:
      return Rice::Essentia::ParameterBase::create_ruby_parameter<Rice::Essentia::IntParameter>(p);
    case essentia::Parameter::ParamType::REAL:
      return Rice::Essentia::ParameterBase::create_ruby_parameter<Rice::Essentia::RealParameter>(p);
    case essentia::Parameter::ParamType::STRING:
      return Rice::Essentia::ParameterBase::create_ruby_parameter<Rice::Essentia::StringParameter>(p);
    case essentia::Parameter::ParamType::BOOL:
      return Rice::Essentia::ParameterBase::create_ruby_parameter<Rice::Essentia::BoolParameter>(p);
    case essentia::Parameter::ParamType::STEREOSAMPLE:
      return Rice::Essentia::ParameterBase::create_ruby_parameter<Rice::Essentia::StereoSampleParameter>(p);
    case essentia::Parameter::ParamType::VECTOR_REAL:
      return Rice::Essentia::ParameterBase::create_ruby_parameter<Rice::Essentia::VectorRealParameter>(p);
    case essentia::Parameter::ParamType::VECTOR_STRING:
      return Rice::Essentia::ParameterBase::create_ruby_parameter<Rice::Essentia::VectorStringParameter>(p);
    case essentia::Parameter::ParamType::VECTOR_INT:
      return Rice::Essentia::ParameterBase::create_ruby_parameter<Rice::Essentia::VectorIntParameter>(p);
    case essentia::Parameter::ParamType::VECTOR_STEREOSAMPLE:
      return Rice::Essentia::ParameterBase::create_ruby_parameter<Rice::Essentia::VectorStereoSampleParameter>(p);
    default:
      throw essentia::EssentiaException("ParameterBase: unhandled parameter type");
  }
}
