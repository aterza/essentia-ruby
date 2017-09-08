#include "modules.hpp"
#include <essentia/essentia.h>

namespace Rice {
  namespace Essentia {

    void setup_essentia()
    {
       essentia_module()
         .define_singleton_method("init", &essentia::init)
         .define_singleton_method("is_initialized?", &essentia::isInitialized)
         .define_singleton_method("shutdown", &essentia::shutdown);
    }

  }
}
