#if !defined(_RICE_ESSENTIA_PARAMETER_HPP_)
# define _RICE_ESSENTIA_PARAMETER_HPP_

#include <essentia/parameter.h>

#include "to_from_ruby.hpp"

namespace Rice
{
  namespace Essentia
  {
    //
    // this class is to simplify construction methods
    //
    class ParameterBase : public essentia::Parameter
    {
      public:

        ParameterBase(essentia::Parameter::ParamType pt) : essentia::Parameter(pt) {}

        ParameterBase & operator=(const ParameterBase& p)
        {
          return (ParameterBase&) essentia::Parameter::operator=(p);
        }

        // sequence of overloaded ParameterBase constructors
        ParameterBase(const std::string &s) : essentia::Parameter(s) {}
        ParameterBase(const essentia::Real &r) : essentia::Parameter(r) {}
        ParameterBase(const bool &b) : essentia::Parameter(b) {}
        ParameterBase(const int &i) : essentia::Parameter(i) {}
        ParameterBase(const double &d) : essentia::Parameter(d) {}
        ParameterBase(const uint &u) : essentia::Parameter(u) {}
        ParameterBase(const essentia::StereoSample &ss) : essentia::Parameter(ss) {}
        ParameterBase(const std::vector<essentia::Real> &rv) : essentia::Parameter(rv) {}
        ParameterBase(const std::vector<std::string> &sv) : essentia::Parameter(sv) {}
        ParameterBase(const std::vector<bool> &bv) : essentia::Parameter(bv) {}
        ParameterBase(const std::vector<int> &iv) : essentia::Parameter(iv) {}
    };

    class StringParameter : public ParameterBase
    {
      public:

        StringParameter(const std::string &s) : ParameterBase(s) {}
    };

    class RealParameter : public ParameterBase
    {
      public:

        RealParameter(const essentia::Real &r) : ParameterBase(r) {}
    };

    class BoolParameter : public ParameterBase
    {
      public:

        BoolParameter(const bool &b) : ParameterBase(b) {}
    };

    class IntParameter : public ParameterBase
    {
      public:

        IntParameter(const int &i) : ParameterBase(i) {}
    };

    class DoubleParameter : public ParameterBase
    {
      public:

        DoubleParameter(const double &d) : ParameterBase(d) {}
    };

    class UintParameter : public ParameterBase
    {
      public:

        UintParameter(const uint &u) : ParameterBase(u) {}
    };

    class StereoSampleParameter : public ParameterBase
    {
      public:

        StereoSampleParameter(const essentia::StereoSample& ss) : ParameterBase(ss) {}
    };

    class VectorRealParameter : public ParameterBase
    {
      public:

        VectorRealParameter(const std::vector<essentia::Real>& rv) : ParameterBase(rv) {}
    };

    class VectorStringParameter : public ParameterBase
    {
      public:

        VectorStringParameter(const std::vector<std::string>& sv) : ParameterBase(sv) {}
    };

    class VectorBoolParameter : public ParameterBase
    {
      public:

        VectorBoolParameter(const std::vector<bool>& bv) : ParameterBase(bv) {}
    };

    class VectorIntParameter : public ParameterBase
    {
      public:

        VectorIntParameter(const std::vector<int>& iv) : ParameterBase(iv) {}
    };

    void install_parameters();
  }
}

#endif /* !defined(_RICE_ESSENTIA_PARAMETER_HPP_) */
