#include "modules.hpp"
#include "setup.hpp"
#include "types.hpp"
#include "exception.hpp"
#include "algorithm.hpp"
#include "io_base.hpp"
#include "io.hpp"
#include "parameter.hpp"

extern "C" {

  void Init_essentia_ruby_wrap()
  {
    Rice::Essentia::create_essentia_modules();
    Rice::Essentia::install_essentia_types();
    Rice::Essentia::install_parameters();
    Rice::Essentia::setup_essentia();
    Rice::Essentia::install_io_base();
    Rice::Essentia::Standard::install_io();
    Rice::Essentia::Streaming::install_io();
    Rice::Essentia::Standard::install_algorithm();
    Rice::Essentia::Streaming::install_algorithm();
  }

}
