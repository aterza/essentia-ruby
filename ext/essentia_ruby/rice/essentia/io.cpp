#include "rice/Data_Type.hpp"
#include "rice/Constructor.hpp"

#include <essentia/iotypewrappers_impl.h>
#include "exception.hpp"
#include "modules.hpp"

namespace Rice
{
  namespace Essentia
  {
    namespace Standard
    {

      static Rice::Data_Type<essentia::standard::Input<std::vector<essentia::Real> > > standard_real_vector_input_type;

      static void
      install_real_vector_inputs()
      {
         RUBY_TRY
         {
           standard_real_vector_input_type =
             define_class_under<essentia::standard::Input<std::vector<essentia::Real> > >(essentia_standard_module(), "RealVectorInput")
             .define_constructor(Rice::Constructor<essentia::standard::Input<std::vector<essentia::Real> > >())
             .add_handler<essentia::EssentiaException>(handle_essentia_exception)
             .define_method("full_name", &essentia::standard::Input<std::vector<essentia::Real> >::fullName)
             .define_method("get", &essentia::standard::Input<std::vector<essentia::Real> >::get)
             ;
         }
         RUBY_CATCH
      }

      static Rice::Data_Type<essentia::standard::Output<std::vector<essentia::Real> > > standard_real_vector_output_type;

      static void
      install_real_vector_outputs()
      {
         RUBY_TRY
         {
           standard_real_vector_output_type =
             define_class_under<essentia::standard::Output<std::vector<essentia::Real> > >(essentia_standard_module(), "RealVectorOutput")
             .define_constructor(Rice::Constructor<essentia::standard::Output<std::vector<essentia::Real> > >())
             .add_handler<essentia::EssentiaException>(handle_essentia_exception)
             .define_method("full_name", &essentia::standard::Output<std::vector<essentia::Real> >::fullName)
             .define_method("get", &essentia::standard::Output<std::vector<essentia::Real> >::get)
             ;
         }
         RUBY_CATCH
      }

      void install_io()
      {
        install_real_vector_inputs();
        install_real_vector_outputs();
      }

    }

//  namespace Streaming
//  {

//    static Rice::Enum<essentia::streaming::AlgorithmStatus> algorithm_status_type;

//    void
//    install_algorithm_status()
//    {
//      algorithm_status_type =
//        define_enum<essentia::streaming::AlgorithmStatus>("AlgorithmStatus", essentia_streaming_module())
//        .define_value("OK", essentia::streaming::AlgorithmStatus::OK)
//        .define_value("CONTINUE", essentia::streaming::AlgorithmStatus::CONTINUE)
//        .define_value("PASS", essentia::streaming::AlgorithmStatus::PASS)
//        .define_value("FINISHED", essentia::streaming::AlgorithmStatus::FINISHED)
//        .define_value("NO_INPUT", essentia::streaming::AlgorithmStatus::NO_INPUT)
//        .define_value("NO_OUTPUT", essentia::streaming::AlgorithmStatus::NO_OUTPUT)
//        ;
//    }

//    static Rice::Data_Type<essentia::streaming::Algorithm> streaming_algorithm_type;
//    typedef void (essentia::streaming::Algorithm::*set_should_stop)(bool);
//    typedef bool (essentia::streaming::Algorithm::*get_should_stop)(void) const;

//    void
//    install_algorithm()
//    {
//       RUBY_TRY
//       {
//         install_algorithm_status();
//         streaming_algorithm_type =
//           define_class_under<essentia::streaming::Algorithm>(essentia_streaming_module(), "Algorithm")
//           .add_handler<essentia::EssentiaException>(handle_essentia_exception)
//           .define_method("reset", &essentia::streaming::Algorithm::reset)
//           .define_method("input_names", &essentia::streaming::Algorithm::inputNames)
//           .define_method("output_names", &essentia::streaming::Algorithm::outputNames)
//           .define_method("should_stop", set_should_stop(&essentia::streaming::Algorithm::shouldStop))
//           .define_method("should_stop?", get_should_stop(&essentia::streaming::Algorithm::shouldStop))
//           .define_method("disconnect_all", &essentia::streaming::Algorithm::disconnectAll)
//           .define_method("process", &essentia::streaming::Algorithm::process)
//           ;
//       }
//       RUBY_CATCH
//    }

//  }
  }
}

