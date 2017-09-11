#include "rice/Data_Type.hpp"
#include "rice/Enum.hpp"
#include "rice/Constructor.hpp"

#include "essentia/iotypewrappers.h"

#include "exception.hpp"
#include "modules.hpp"
#include "algorithm.hpp"

namespace Rice
{
  namespace Essentia
  {
    namespace Standard
    {

      static Rice::Data_Type<essentia::standard::Algorithm> standard_algorithm_type;

      typedef void (essentia::standard::Algorithm::*configure_with_parameters)(const essentia::ParameterMap&);
      typedef void (essentia::standard::Algorithm::*configure_without_parameters)(void);

      void
      install_algorithm()
      {
         RUBY_TRY
         {
           standard_algorithm_type =
             define_class_under<essentia::standard::Algorithm>(essentia_standard_module(), "Algorithm")
             .define_director<AlgorithmProxy>()
             .define_constructor(Rice::Constructor<AlgorithmProxy, Rice::Object>())
             .add_handler<essentia::EssentiaException>(handle_essentia_exception)
             .define_method("reset", &AlgorithmProxy::default_reset)
             .define_method("compute", &AlgorithmProxy::default_compute)
             .define_method("input_names", &AlgorithmProxy::inputNames)
             .define_method("output_names", &AlgorithmProxy::outputNames)
             .define_method("input_types", &AlgorithmProxy::inputTypes)
             .define_method("output_types", &AlgorithmProxy::outputTypes)
             .define_method("declare_parameters", &AlgorithmProxy::default_declareParameters)
             .define_method("set_parameters", &AlgorithmProxy::default_setParameters)
             .define_method("configure=", configure_with_parameters(&AlgorithmProxy::default_configure)) 
             .define_method("configure", configure_without_parameters(&AlgorithmProxy::default_configure)) 
             .define_method("default_parameters", &AlgorithmProxy::defaultParameters)
             .define_method("parameter", &AlgorithmProxy::parameter)
             ;
         }
         RUBY_CATCH
      }

    }

    namespace Streaming
    {

      static Rice::Enum<essentia::streaming::AlgorithmStatus> algorithm_status_type;

      static void
      install_algorithm_status()
      {
        algorithm_status_type =
          define_enum<essentia::streaming::AlgorithmStatus>("AlgorithmStatus", essentia_streaming_module())
          .define_value("OK", essentia::streaming::AlgorithmStatus::OK)
          .define_value("CONTINUE", essentia::streaming::AlgorithmStatus::CONTINUE)
          .define_value("PASS", essentia::streaming::AlgorithmStatus::PASS)
          .define_value("FINISHED", essentia::streaming::AlgorithmStatus::FINISHED)
          .define_value("NO_INPUT", essentia::streaming::AlgorithmStatus::NO_INPUT)
          .define_value("NO_OUTPUT", essentia::streaming::AlgorithmStatus::NO_OUTPUT)
          ;
      }

      typedef void (*straight_connect)(essentia::streaming::SourceBase&, essentia::streaming::SinkBase&);
      typedef void (*reverse_connect)(essentia::streaming::SinkBase&, essentia::streaming::SourceBase&);
      typedef void (*connect_algorithms)(essentia::streaming::Algorithm *, const std::string&, essentia::streaming::Algorithm *, const std::string&);
      typedef void (*connect_to_devnull)(essentia::streaming::SourceBase&, essentia::streaming::DevNullConnector);
      typedef void (*disconnect_from_source)(essentia::streaming::SourceBase&, essentia::streaming::SinkBase&);
      typedef void (*disconnect_from_devnull)(essentia::streaming::SourceBase&, essentia::streaming::DevNullConnector);

      static void
      install_module_functions()
      {
        essentia_streaming_module()
          .define_module_function("connect", straight_connect(&essentia::streaming::connect))
          .define_module_function("reverse_connect", reverse_connect(&essentia::streaming::connect))
          .define_module_function("connect_algorithms", connect_algorithms(&essentia::streaming::connect))
          .define_module_function("connect_algorithms", connect_to_devnull(&essentia::streaming::connect))
          .define_module_function("disconnect", disconnect_from_source(&essentia::streaming::disconnect))
          .define_module_function("disconnect", disconnect_from_devnull(&essentia::streaming::disconnect))
//        .define_module_function(">>", &essentia::streaming::operator>>)
          ;
      }

      static Rice::Data_Type<essentia::streaming::StreamingAlgorithmWrapper> streaming_algorithm_type;
      typedef void (essentia::streaming::Algorithm::*set_should_stop)(bool);
      typedef bool (essentia::streaming::Algorithm::*get_should_stop)(void) const;
      typedef void (essentia::streaming::Algorithm::*configure_with_parameters)(const essentia::ParameterMap&);
      typedef void (essentia::streaming::Algorithm::*configure_without_parameters)(void);

      void
      install_algorithm()
      {
         RUBY_TRY
         {
           install_algorithm_status();
           install_module_functions();

           streaming_algorithm_type =
             define_class_under<essentia::streaming::StreamingAlgorithmWrapper>(essentia_streaming_module(), "Algorithm")
             .define_director<AlgorithmProxy>()
             .define_constructor(Rice::Constructor<AlgorithmProxy, Rice::Object>())
             .add_handler<essentia::EssentiaException>(handle_essentia_exception)
             .define_method("reset", &AlgorithmProxy::default_reset)
             .define_method("input_names", &AlgorithmProxy::inputNames)
             .define_method("output_names", &AlgorithmProxy::outputNames)
             .define_method("should_stop", set_should_stop(&AlgorithmProxy::default_shouldStop))
             .define_method("should_stop?", get_should_stop(&AlgorithmProxy::default_shouldStop))
             .define_method("acquire_data", &AlgorithmProxy::acquireData)
             .define_method("release_data", &AlgorithmProxy::releaseData)
             .define_method("disconnect_all", &AlgorithmProxy::disconnectAll)
             .define_method("process", &AlgorithmProxy::default_process)
             .define_method("declare_parameters", &AlgorithmProxy::default_declareParameters)
             .define_method("set_parameters", &AlgorithmProxy::default_setParameters)
             .define_method("configure=", configure_with_parameters(&AlgorithmProxy::default_configure)) 
             .define_method("configure", configure_without_parameters(&AlgorithmProxy::default_configure)) 
             .define_method("default_parameters", &AlgorithmProxy::defaultParameters)
             .define_method("parameter", &AlgorithmProxy::parameter)
             .define_method("synchronize_input", &AlgorithmProxy::synchronizeInput)
             .define_method("synchronize_output", &AlgorithmProxy::synchronizeOutput)
             .define_method("synchronize_io", &AlgorithmProxy::synchronizeIO)
             ;
         }
         RUBY_CATCH
      }
    }
  }
}
