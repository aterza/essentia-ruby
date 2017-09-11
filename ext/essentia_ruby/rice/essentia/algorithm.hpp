#if !defined(_RICE_ESSENTIA_ALGORITHM_HPP_)
# define _RICE_ESSENTIA_ALGORITHM_HPP_

#include "essentia/parameter.h"
#include "essentia/algorithm.h"
#include "essentia/streaming/streamingalgorithmwrapper.h"

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

        // methods from superclass Configurable

        virtual void declareParameters()
        {
          getSelf().call("declare_parameters");
        }

        void default_declareParameters()
        {
          raisePureVirtual();
        }

        virtual void setParameters(const essentia::ParameterMap& params)
        {
          getSelf().call("set_parameters", params);
        }

        void default_setParameters(const essentia::ParameterMap& params)
        {
          this->setParameters(params);
        }

        virtual void configure(const essentia::ParameterMap& params)
        {
          getSelf().call("configure", params);
        }

        void default_configure(const essentia::ParameterMap& params)
        {
          this->configure(params);
        }

        virtual void configure()
        {
          getSelf().call("configure");
        }

        void default_configure()
        {
          this->configure();
        }

      };

      void install_algorithm();
    }

    namespace Streaming
    {
      class AlgorithmProxy : public essentia::streaming::StreamingAlgorithmWrapper, public Rice::Director
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
          this->shouldStop(stop);
        }

        virtual bool shouldStop() const
        {
          return from_ruby<bool>(getSelf().call("should_stop?"));
        }

        bool default_shouldStop() const
        {
          return this->shouldStop();
        }

        // methods from superclass Configurable

        virtual void declareParameters()
        {
          getSelf().call("declare_parameters");
        }

        void default_declareParameters()
        {
          raisePureVirtual();
        }

        virtual void setParameters(const essentia::ParameterMap& params)
        {
          getSelf().call("set_parameters", params);
        }

        void default_setParameters(const essentia::ParameterMap& params)
        {
          this->setParameters(params);
        }

        virtual void configure(const essentia::ParameterMap& params)
        {
          getSelf().call("configure", params);
        }

        void default_configure(const essentia::ParameterMap& params)
        {
          this->configure(params);
        }

        virtual void configure()
        {
          getSelf().call("configure");
        }

        void default_configure()
        {
          this->configure();
        }

      };

      void install_algorithm();
    }
  }
}

#endif /* !defined(_RICE_ESSENTIA_ALGORITHM_HPP_) */
