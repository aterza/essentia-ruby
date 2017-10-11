#include <typeinfo>
#include "rice/Data_Type.hpp"
#include "rice/Constructor.hpp"

#include "io_base.hpp"
#include "exception.hpp"
#include "modules.hpp"

namespace Rice
{
  namespace Essentia
  {
    namespace Standard
    {

      static Rice::Data_Type<essentia::standard::InputBase> input_base_type;

      static void
      install_input_base()
      {
         RUBY_TRY
         {
           input_base_type =
             define_class_under<essentia::standard::InputBase, essentia::TypeProxy>(essentia_standard_module(), "InputBase")
             .add_handler<essentia::EssentiaException>(handle_essentia_exception)
             .define_method("full_name", &essentia::standard::InputBase::fullName)
             .define_method("set_sink_first_token", &essentia::standard::InputBase::setSinkFirstToken)
             .define_method("set_sink_tokens", &essentia::standard::InputBase::setSinkTokens)
             ;
         }
         RUBY_CATCH
      }

      static Rice::Data_Type<essentia::standard::OutputBase> output_base_type;

      static void
      install_output_base()
      {
         RUBY_TRY
         {
           output_base_type =
             define_class_under<essentia::standard::OutputBase, essentia::TypeProxy>(essentia_standard_module(), "OutputBase")
             .add_handler<essentia::EssentiaException>(handle_essentia_exception)
             .define_method("full_name", &essentia::standard::OutputBase::fullName)
             .define_method("set_source_first_token", &essentia::standard::OutputBase::setSourceFirstToken)
             .define_method("set_source_tokens", &essentia::standard::OutputBase::setSourceTokens)
             ;
         }
         RUBY_CATCH
      }

      void install_io_base()
      {
        install_input_base();
        install_output_base();
      }

    }

    namespace Streaming
    {

      static Rice::Data_Type<essentia::streaming::SinkBase> sink_base_type;
      typedef essentia::streaming::SourceBase * (SinkBaseProxy::*get_source)();

      static void
      install_sink_base()
      {
         RUBY_TRY
         {
           sink_base_type =
             define_class_under<essentia::streaming::SinkBase>(essentia_streaming_module(), "SinkBase")
             .define_director<SinkBaseProxy>()
             .add_handler<essentia::EssentiaException>(handle_essentia_exception)
             .define_method("id", &SinkBaseProxy::id)
             .define_method("source", get_source(&SinkBaseProxy::source))
             .define_method("source=", &SinkBaseProxy::default_setSource)
             .define_method("tokens", &SinkBaseProxy::default_getTokens)
             .define_method("first_token", &SinkBaseProxy::default_getFirstToken)
             ;
         }
         RUBY_CATCH
      }

      static Rice::Data_Type<essentia::streaming::SourceBase> source_base_type;
      typedef const std::vector<essentia::streaming::SinkBase*>& (SourceBaseProxy::*get_sinks_const)() const;
      typedef std::vector<essentia::streaming::SinkBase*>& (SourceBaseProxy::*get_sinks_var)();

      static void
      install_source_base()
      {
         RUBY_TRY
         {
           source_base_type =
             define_class_under<essentia::streaming::SourceBase>(essentia_streaming_module(), "SourceBase")
             .define_director<SourceBaseProxy>()
             .add_handler<essentia::EssentiaException>(handle_essentia_exception)
             .define_method("buffer", &SourceBaseProxy::default_buffer)
             .define_method("total_produced", &SourceBaseProxy::default_totalProduced)
             .define_method("sinks", get_sinks_const(&SourceBaseProxy::sinks))
             .define_method("tokens", &SourceBaseProxy::default_getTokens)
             .define_method("first_token", &SourceBaseProxy::default_getFirstToken)
             .define_method("is_proxied?", &SourceBaseProxy::isProxied)
             .define_method("proxied_sinks", &SourceBaseProxy::proxiedSinks)
             .define_method("push_real", &SourceBaseProxy::push_real)
             .define_method("push_vector", &SourceBaseProxy::push_vector)
             .define_method("set_buffer_type", &SourceBaseProxy::default_setBufferType)
             .define_method("buffer_info", &SourceBaseProxy::default_bufferInfo)
             .define_method("set_buffer_info", &SourceBaseProxy::default_setBufferInfo)
             ;
         }
         RUBY_CATCH
      }

      void install_io_base()
      {
        install_sink_base();
        install_source_base();
      }

    }

    void install_io_base()
    {
      Standard::install_io_base();
      Streaming::install_io_base();
    }

  }
}
