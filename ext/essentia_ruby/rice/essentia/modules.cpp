#include "modules.hpp"

namespace Rice {
  namespace Essentia {

    static Rice::Module rb_mEssentia;
    static Rice::Module rb_mEssentiaStandard;
    static Rice::Module rb_mEssentiaStreaming;
    static Rice::Module rb_mEssentiaStreamingAlgorithm;
    static Rice::Module rb_mEssentiaScheduler;

    void create_essentia_modules()
    {
      rb_mEssentia = define_module("Essentia");
      rb_mEssentiaStandard = define_module_under(rb_mEssentia, "Standard");
      rb_mEssentiaStreaming = define_module_under(rb_mEssentia, "Streaming");
      rb_mEssentiaStreamingAlgorithm = define_module_under(rb_mEssentiaStreaming, "Algorithm");
      rb_mEssentiaScheduler = define_module_under(rb_mEssentia, "Scheduler");
    }

    Rice::Module essentia_module()
    {
      return rb_mEssentia;
    }

    Rice::Module essentia_standard_module()
    {
      return rb_mEssentiaStandard;
    }

    Rice::Module essentia_streaming_module()
    {
      return rb_mEssentiaStreaming;
    }

    Rice::Module essentia_streaming_algorithm_module()
    {
      return rb_mEssentiaStreamingAlgorithm;
    }

    Rice::Module essentia_scheduler_module()
    {
      return rb_mEssentiaScheduler;
    }

  }
}
