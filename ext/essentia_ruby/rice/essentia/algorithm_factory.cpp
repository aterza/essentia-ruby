#include "rice/Data_Type.hpp"
#include "rice/Constructor.hpp"

#include <essentia/algorithmfactory.h>
#include "exception.hpp"
#include "modules.hpp"

namespace Rice
{
  namespace Essentia
  {
    namespace Standard
    {

      static Rice::Data_Type<essentia::standard::AlgorithmFactory> standard_algorithm_factory_type;

      void
      install_algorithm_factory()
      {
         RUBY_TRY
         {
           standard_algorithm_factory_type =
              define_class_under<essentia::standard::AlgorithmFactory>(essentia_standard_module(), "AlgorithmFactory")
             .add_handler<essentia::EssentiaException>(handle_essentia_exception)
             .define_method("instance", &essentia::standard::AlgorithmFactory::instance);
         }
         RUBY_CATCH
      }

    }

  }
}
