#if !defined(_RICE_ESSENTIA_IO_BASE_HPP_)
# define _RICE_ESSENTIA_IO_BASE_HPP_

#include "rice/Director.hpp"

#include "to_from_ruby.hpp"
#include "types.hpp"

#include <essentia/iotypewrappers_impl.h>

namespace Rice
{
  namespace Essentia
  {
    namespace Standard
    {
      void install_io_base();
    }

    namespace Streaming
    {
      class SinkBaseProxy : public essentia::streaming::SinkBase, public Rice::Director
      {

        public:

        SinkBaseProxy(Rice::Object self, const std::string& name) : essentia::streaming::SinkBase(name), Rice::Director(self) {}

        virtual void setSource(essentia::streaming::SourceBase *source)
        {
          getSelf().call("set_source", to_ruby<essentia::streaming::SourceBase *>(source));
        }

        void default_setSource(essentia::streaming::SourceBase *source)
        {
          this->setSource(source);
        }

        virtual void setId(essentia::ReaderID id)
        {
          getSelf().call("set_id", id);
        }

        void default_setId(essentia::ReaderID id)
        {
          this->setId(id);
        }

        virtual const void *getTokens() const
        {
          return from_ruby<Rice::void_masker *>(getSelf().call("tokens"));
        }

        const void_masker *default_getTokens() const
        {
          return (void_masker *)(this->getTokens());
        }

        virtual const void *getFirstToken() const
        {
          return from_ruby<Rice::void_masker *>(getSelf().call("first_token"));
        }

        const void_masker *default_getFirstToken() const
        {
          return (void_masker *)(this->getFirstToken());
        }


      };

      class SourceBaseProxy : public essentia::streaming::SourceBase, public Rice::Director
      {

        public:

        SourceBaseProxy(Rice::Object self, const std::string& name) : essentia::streaming::SourceBase(name), Rice::Director(self) {}

        virtual void *buffer()
        {
          return from_ruby<Rice::void_masker *>(getSelf().call("buffer"));
        }

        void_masker *default_buffer()
        {
          return (void_masker *)(this->buffer());
        }

        virtual int totalProduced() const
        {
          return from_ruby<int>(getSelf().call("total_produced"));
        }

        int default_totalProduced() const
        {
          return this->totalProduced();
        }

        virtual void *getTokens()
        {
          return from_ruby<Rice::void_masker *>(getSelf().call("tokens"));
        }

        void_masker *default_getTokens()
        {
          return (void_masker *)(this->getTokens());
        }

        virtual void *getFirstToken()
        {
          return from_ruby<Rice::void_masker *>(getSelf().call("first_token"));
        }

        void_masker *default_getFirstToken()
        {
          return (void_masker *)(this->getFirstToken());
        }

        virtual void setBufferType(essentia::streaming::BufferUsage::BufferUsageType t)
        {
          getSelf().call("set_buffer_type", t);
        }

        void default_setBufferType(essentia::streaming::BufferUsage::BufferUsageType t)
        {
          this->setBufferType(t);
        }

        virtual essentia::streaming::BufferInfo bufferInfo() const
        {
          return from_ruby<essentia::streaming::BufferInfo>(getSelf().call("buffer_info"));
        }

        essentia::streaming::BufferInfo default_bufferInfo() const
        {
          return this->bufferInfo();
        }

        virtual void setBufferInfo(const essentia::streaming::BufferInfo& info)
        {
          getSelf().call("buffer_info", to_ruby<essentia::streaming::BufferInfo>(info));
        }

        void default_setBufferInfo(const essentia::streaming::BufferInfo & info)
        {
          this->setBufferInfo(info);
        }

        void push_real(const essentia::Real& v)
        {
          this->push<essentia::Real>(v);
        }

        void push_vector(const std::vector<essentia::Real>& v)
        {
          this->push<std::vector<essentia::Real> >(v);
        }

      };

      void install_io_base();
    }

    void install_io_base();
  }
}

#endif /* !defined(_RICE_ESSENTIA_IO_BASE_HPP_) */

