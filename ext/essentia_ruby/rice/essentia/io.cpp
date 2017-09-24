#include "rice/Data_Type.hpp"
#include "rice/Constructor.hpp"

#include <essentia/iotypewrappers_impl.h>
#include <essentia/streaming/sink.h>
#include <essentia/streaming/source.h>

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
             define_class_under<essentia::standard::Input<std::vector<essentia::Real> >, essentia::standard::InputBase>(essentia_standard_module(), "RealVectorInput")
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
             define_class_under<essentia::standard::Output<std::vector<essentia::Real> >, essentia::standard::OutputBase >(essentia_standard_module(), "RealVectorOutput")
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

    namespace Streaming
    {
      static Rice::Data_Type<essentia::streaming::Sink<std::vector<essentia::Real> > > streaming_real_vector_sink_type;

      static void
      install_real_vector_sinks()
      {
         RUBY_TRY
         {
           streaming_real_vector_sink_type =
             define_class_under<essentia::streaming::Sink<std::vector<essentia::Real> >, essentia::streaming::SinkBase>(essentia_streaming_module(), "RealVectorSink")
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
             define_class_under<essentia::streaming::Source<std::vector<essentia::Real> >, essentia::streaming::SourceBase>(essentia_streaming_module(), "RealVectorSource")
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
