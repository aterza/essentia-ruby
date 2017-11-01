#include "modules.hpp"
#include "setup.hpp"
#include "types.hpp"
#include "exception.hpp"
#include "algorithm.hpp"
#include "io_base.hpp"
#include "io.hpp"
#include "parameter.hpp"
#include "parameter_map.hpp"
#include "description_map.hpp"

extern "C" {

  void Init_essentia_ruby_wrap()
  {
    Rice::Essentia::create_essentia_modules();
    Rice::Essentia::install_essentia_types();
    Rice::Essentia::install_parameters();
    Rice::Essentia::install_parameter_maps();
    Rice::Essentia::install_description_maps();
    Rice::Essentia::setup_essentia();
    Rice::Essentia::install_io_base();
    Rice::Essentia::Standard::install_io();
    Rice::Essentia::Streaming::install_io();
    Rice::Essentia::Standard::install_algorithm();
    Rice::Essentia::Streaming::install_algorithm();
  }

}
