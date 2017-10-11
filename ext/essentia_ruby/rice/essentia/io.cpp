#include "rice/Data_Type.hpp"
#include "rice/Constructor.hpp"

#include <essentia/iotypewrappers_impl.h>
#include <essentia/streaming/sink.h>
#include <essentia/streaming/source.h>

#include "exception.hpp"
#include "modules.hpp"
#include "io.hpp"

namespace Rice
{
  namespace Essentia
  {
    namespace Standard
    {

      /*
       * We need to wrap extra methods into the Input class to take the
       * templating into account, so we wrap also the original specialization
       * into an _undocumented_ wrapping in order to achieve it.
       * The same applies to the Output class below
       */
      static Rice::Data_Type<essentia::standard::Input<std::vector<essentia::Real> > > standard_real_vector_input_orig_type;
      static Rice::Data_Type<Rice::Essentia::Standard::RealVectorInput> standard_real_vector_input_type;

      static void
      install_real_vector_inputs()
      {
         RUBY_TRY
         {
           standard_real_vector_input_orig_type =
             define_class_under<essentia::standard::Input<std::vector<essentia::Real> >, essentia::standard::InputBase >(essentia_standard_module(), "Rice_essentia_RealVectorInput_")
             ;

           standard_real_vector_input_type =
             define_class_under<Rice::Essentia::Standard::RealVectorInput, essentia::standard::Input<std::vector<essentia::Real> > >(essentia_standard_module(), "RealVectorInput")
#if 0
             define_class_under<essentia::standard::Input<std::vector<essentia::Real> >, essentia::standard::InputBase >(essentia_standard_module(), "RealVectorInput")
#endif
#if 0
             .define_constructor(Rice::Constructor<Rice::Essentia::Standard::RealVectorInput >())
#endif
             .define_constructor(Rice::Constructor<essentia::standard::Input<std::vector<essentia::Real> > >())
             .add_handler<essentia::EssentiaException>(handle_essentia_exception)
#if 0
             .define_method("full_name", &Rice::Essentia::Standard::RealVectorInput::fullName)
#endif
             .define_method("set_vector", &Rice::Essentia::Standard::RealVectorInput::setVector)
#if 0
             .define_method("get_vector", &Rice::Essentia::Standard::RealVectorInput::getVector)
#endif
             ;
         }
         RUBY_CATCH
      }

#if 0
      static Rice::Data_Type<essentia::standard::Output<std::vector<essentia::Real> > > standard_real_vector_output_orig_type;
      static Rice::Data_Type<Rice::Essentia::Standard::RealVectorOutput> standard_real_vector_output_type;
#endif
      static Rice::Data_Type<essentia::standard::Output<std::vector<essentia::Real> > > standard_real_vector_output_type;

      static void
      install_real_vector_outputs()
      {
         RUBY_TRY
         {
    #if 0
           standard_real_vector_output_orig_type =
             define_class_under<essentia::standard::Output<std::vector<essentia::Real> >, essentia::standard::OutputBase >(essentia_standard_module(), "Rice_essentia_RealVectorOutput_")
             ;
    #endif

           standard_real_vector_output_type =
#if 0
             define_class_under<Rice::Essentia::Standard::RealVectorOutput, essentia::standard::OutputBase >(essentia_standard_module(), "RealVectorOutput")
#endif
             define_class_under<essentia::standard::Output<std::vector<essentia::Real> >, essentia::standard::OutputBase >(essentia_standard_module(), "RealVectorOutput")
#if 0
             .define_constructor(Rice::Constructor<Rice::Essentia::Standard::RealVectorOutput >())
#endif
             .define_constructor(Rice::Constructor<essentia::standard::Output<std::vector<essentia::Real> > >())
             .add_handler<essentia::EssentiaException>(handle_essentia_exception)
#if 0
             .define_method("full_name", &Rice::Essentia::Standard::RealVectorOutput::fullName)
             .define_method("set_vector", &Rice::Essentia::Standard::RealVectorOutput::setVector)
             .define_method("get", &Rice::Essentia::Standard::RealVectorOutput::get)
#endif
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

    namespace Streaming
    {
      static Rice::Data_Type<essentia::streaming::Sink<std::vector<essentia::Real> > > streaming_real_vector_sink_type;

      static void
      install_real_vector_sinks()
      {
         RUBY_TRY
         {
           streaming_real_vector_sink_type =
#if 0
             define_class_under<essentia::streaming::Sink<std::vector<essentia::Real> >, essentia::streaming::SinkBase >(essentia_streaming_module(), "RealVectorSink")
#endif
             define_class_under<Rice::Essentia::Streaming::RealVectorSink, Rice::Essentia::Streaming::SinkBaseProxy >(essentia_streaming_module(), "RealVectorSink")
             .define_constructor(Rice::Constructor<essentia::streaming::Sink<std::vector<essentia::Real> > >())
             .add_handler<essentia::EssentiaException>(handle_essentia_exception)
#if 0
             .define_method("full_name", &essentia::streaming::Sink<std::vector<essentia::Real> >::fullName)
             .define_method("get", &essentia::streaming::Sink<std::vector<essentia::Real> >::get)
#endif
             ;
         }
         RUBY_CATCH
      }

      static Rice::Data_Type<essentia::streaming::Source<std::vector<essentia::Real> > > streaming_real_vector_source_type;

      static void
      install_real_vector_sources()
      {
         RUBY_TRY
         {
           streaming_real_vector_source_type =
#if 0
             define_class_under<essentia::streaming::Source<std::vector<essentia::Real> >, essentia::streaming::SourceBase >(essentia_streaming_module(), "RealVectorSource")
#endif
             define_class_under<Rice::Essentia::Streaming::RealVectorSource, Rice::Essentia::Streaming::SourceBaseProxy >(essentia_streaming_module(), "RealVectorSource")
             .define_constructor(Rice::Constructor<essentia::streaming::Source<std::vector<essentia::Real> > >())
             .add_handler<essentia::EssentiaException>(handle_essentia_exception)
#if 0
             .define_method("full_name", &essentia::streaming::Source<std::vector<essentia::Real> >::fullName)
             .define_method("get", &essentia::streaming::Source<std::vector<essentia::Real> >::get)
#endif
             ;
         }
         RUBY_CATCH
      }

      void install_io()
      {
        install_real_vector_sinks();
        install_real_vector_sources();
      }
    }

  }

}
