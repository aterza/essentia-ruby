#if !defined(_RICE_ESSENTIA_IO_HPP_)
# define _RICE_ESSENTIA_IO_HPP_

#include "io_base.hpp"

namespace Rice
{
  namespace Essentia
  {
    namespace Standard
    {
      class RealVectorInput : public essentia::standard::Input<std::vector<essentia::Real > >
      {
      public:
         void setVector(Rice::Object v)
         {
           this->set<const std::vector<essentia::Real> &>(from_ruby<const std::vector<essentia::Real> &>(v));
         }

#if 0
         const Rice::Object& getVector() const
         {
           Array a(to_ruby<const std::vector<essentia::Real>& >(this->get()));
           return a;
           return to_ruby<std::vector<essentia::Real> >(this->get());
         }
#endif
      };

      class RealVectorOutput : public essentia::standard::Output<std::vector<essentia::Real > >
      {
      public:
         void setVector(std::vector<essentia::Real>& v)
         {
           this->set<std::vector<essentia::Real> &>(v);
         }
      };

      void install_io();
    }

    namespace Streaming
    {
      class RealVectorSink : public essentia::streaming::Sink<std::vector<essentia::Real > >, public Rice::Essentia::Streaming::SinkBaseProxy
      {
      };

      class RealVectorSource : public essentia::streaming::Source<std::vector<essentia::Real > >, public Rice::Essentia::Streaming::SourceBaseProxy
      {
      };

      void install_io();
    }

  }
}

#endif /* !defined(_RICE_ESSENTIA_IO_HPP_) */

