#include "rice//Exception.hpp"

#include "exception.hpp"

namespace Rice {
  namespace Essentia {

    void handle_essentia_exception(essentia::EssentiaException const &ex)
    {
      std::stringstream msg;
      msg << "Essentia error: " << ex.what();
      throw Rice::Exception(rb_eRuntimeError, msg.str().c_str());
    }

  }
}
