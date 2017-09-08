#if !defined(_EXCEPTION_HPP_)
#  define _EXCEPTION_HPP_

#include <essentia/types.h>

namespace Rice {
  namespace Essentia {

    void handle_essentia_exception(essentia::EssentiaException const &);

  }
}

#endif /* !defined(_EXCEPTION_HPP_) */
