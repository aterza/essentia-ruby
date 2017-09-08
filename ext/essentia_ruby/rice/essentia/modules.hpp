#if !defined(_MODULES_HPP_)
#  define _MODULES_HPP_

#include "rice/Module.hpp"

namespace Rice {
  namespace Essentia {

    void create_essentia_modules();
    Rice::Module essentia_module();
    Rice::Module essentia_standard_module();
    Rice::Module essentia_streaming_module();
    Rice::Module essentia_streaming_algorithm_module();
    Rice::Module essentia_scheduler_module();

  }
}

#endif /* !defined(_MODULES_HPP_) */
