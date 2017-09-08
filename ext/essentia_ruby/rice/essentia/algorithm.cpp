#include "rice/Data_Type.hpp"
#include "rice/Enum.hpp"
#include "rice/Constructor.hpp"

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
             ;
         }
         RUBY_CATCH
      }

    }

    namespace Streaming
    {

      static Rice::Enum<essentia::streaming::AlgorithmStatus> algorithm_status_type;

      void
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

      static Rice::Data_Type<essentia::streaming::Algorithm> streaming_algorithm_type;
      typedef void (AlgorithmProxy::*set_should_stop)(bool);
      typedef bool (AlgorithmProxy::*get_should_stop)(void) const;

      void
      install_algorithm()
      {
         RUBY_TRY
         {
           streaming_algorithm_type =
             define_class_under<essentia::streaming::Algorithm>(essentia_streaming_module(), "Algorithm")
             .define_director<AlgorithmProxy>()
             .define_constructor(Rice::Constructor<AlgorithmProxy, Rice::Object>())
             .add_handler<essentia::EssentiaException>(handle_essentia_exception)
             .define_method("reset", &AlgorithmProxy::default_reset)
             .define_method("input_names", &AlgorithmProxy::inputNames)
             .define_method("output_names", &AlgorithmProxy::outputNames)
             .define_method("should_stop", set_should_stop(&AlgorithmProxy::default_shouldStop))
             .define_method("should_stop?", get_should_stop(&AlgorithmProxy::default_shouldStop))
             .define_method("disconnect_all", &AlgorithmProxy::disconnectAll)
             .define_method("process", &AlgorithmProxy::default_process)
             .define_method("declare_parameters", &AlgorithmProxy::default_declareParameters)
             ;
           install_algorithm_status();
         }
         RUBY_CATCH
      }

    }
  }
}
