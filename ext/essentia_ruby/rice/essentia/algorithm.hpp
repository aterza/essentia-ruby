#if !defined(_RICE_ESSENTIA_ALGORITHM_HPP_)
# define _RICE_ESSENTIA_ALGORITHM_HPP_

#include "essentia/algorithm.h"
#include "essentia/streaming/streamingalgorithm.h"

#include "rice/Director.hpp"

namespace Rice
{
  namespace Essentia
  {
    namespace Standard
    {
      class AlgorithmProxy : public essentia::standard::Algorithm, public Rice::Director
      {

        public:
        AlgorithmProxy(Rice::Object self) : Rice::Director(self) {}

        virtual void compute()
        {
          getSelf().call("compute");
        }

        void default_compute()
        {
          raisePureVirtual();
        }

        virtual void reset()
        {
          getSelf().call("reset");
        }

        void default_reset()
        {
          essentia::standard::Algorithm::reset();
        }

        virtual void declareParameters()
        {
          getSelf().call("declare_parameters");
        }

        void default_declareParameters()
        {
          raisePureVirtual();
        }
      };

      void install_algorithm();
    }

    namespace Streaming
    {
      class AlgorithmProxy : public essentia::streaming::Algorithm, public Rice::Director
      {

        public:
        AlgorithmProxy(Rice::Object self) : Rice::Director(self) {}

        virtual essentia::streaming::AlgorithmStatus process()
        {
          return from_ruby<essentia::streaming::AlgorithmStatus>(getSelf().call("process"));
        }

        essentia::streaming::AlgorithmStatus default_process()
        {
          raisePureVirtual();
          return essentia::streaming::AlgorithmStatus::FINISHED;
        }

        virtual void reset()
        {
          getSelf().call("reset");
        }

        void default_reset()
        {
          essentia::streaming::Algorithm::reset();
        }

        virtual void shouldStop(bool stop)
        {
          getSelf().call("should_stop");
        }

        void default_shouldStop(bool stop)
        {
          essentia::streaming::Algorithm::shouldStop(stop);
        }

        virtual bool shouldStop() const
        {
          return from_ruby<bool>(getSelf().call("should_stop?"));
        }

        bool default_shouldStop() const
        {
          return essentia::streaming::Algorithm::shouldStop();
        }

        virtual void declareParameters()
        {
          getSelf().call("declare_parameters");
        }

        void default_declareParameters()
        {
          raisePureVirtual();
        }
      };

      void install_algorithm();
    }
  }
}

#endif /* !defined(_RICE_ESSENTIA_ALGORITHM_HPP_) */
