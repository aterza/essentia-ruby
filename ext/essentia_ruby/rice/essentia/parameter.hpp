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
        ParameterBase(const essentia::Parameter &p) : essentia::Parameter(p) {}

        ParameterBase & operator=(const ParameterBase& p)
        {
          return (ParameterBase&) essentia::Parameter::operator=(p);
        }


        Rice::Object value() const; // default value() method, to be overridden

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
        ParameterBase(const std::vector<essentia::StereoSample> &ssv) : essentia::Parameter(ssv) {}
    };

    class StringParameter : public ParameterBase
    {
      public:

        StringParameter(const std::string &s) : ParameterBase(s) {}

        Rice::Object value() const { return to_ruby(toString()); }
    };

    class RealParameter : public ParameterBase
    {
      public:

        RealParameter(const essentia::Real &r) : ParameterBase(r) {}

        Rice::Object value() const { return to_ruby(toReal()); }
    };

    class BoolParameter : public ParameterBase
    {
      public:

        BoolParameter(const bool &b) : ParameterBase(b) {}

        Rice::Object value() const { return to_ruby(toBool()); }
    };

    class IntParameter : public ParameterBase
    {
      public:

        IntParameter(const int &i) : ParameterBase(i) {}
        // no need to override
    };

    class DoubleParameter : public ParameterBase
    {
      public:

        DoubleParameter(const double &d) : ParameterBase(d) {}

        Rice::Object value() const { return to_ruby(toDouble()); }
    };

    class UintParameter : public ParameterBase
    {
      public:

        UintParameter(const uint &u) : ParameterBase(u) {}
        // no need to override
    };

    class StereoSampleParameter : public ParameterBase
    {
      public:

        StereoSampleParameter(const essentia::StereoSample& ss) : ParameterBase(ss) {}

        Rice::Object value() const { return to_ruby(toStereoSample()); }
    };

    class VectorRealParameter : public ParameterBase
    {
      public:

        VectorRealParameter(const std::vector<essentia::Real>& rv) : ParameterBase(rv) {}

        Rice::Object value() const { return to_ruby(toVectorReal()); }
    };

    class VectorStringParameter : public ParameterBase
    {
      public:

        VectorStringParameter(const std::vector<std::string>& sv) : ParameterBase(sv) {}

        Rice::Object value() const { return to_ruby(toVectorString()); }
    };

    class VectorBoolParameter : public ParameterBase
    {
      public:

        VectorBoolParameter(const std::vector<bool>& bv) : ParameterBase(bv) {}

        Rice::Object value() const { return to_ruby(toVectorBool()); }
    };

    class VectorIntParameter : public ParameterBase
    {
      public:

        VectorIntParameter(const std::vector<int>& iv) : ParameterBase(iv) {}

        Rice::Object value() const { return to_ruby(toVectorInt()); }
    };

    class VectorStereoSampleParameter : public ParameterBase
    {
      public:

        VectorStereoSampleParameter(const std::vector<essentia::StereoSample>& ssv) : ParameterBase(ssv) {}

        Rice::Object value() const { return to_ruby(toVectorStereoSample()); }
    };

    void install_parameters();
  }
}

/*
 * to/from ruby prototypes
 */

template <> Rice::Object to_ruby<essentia::Parameter>(essentia::Parameter const &);

#endif /* !defined(_RICE_ESSENTIA_PARAMETER_HPP_) */
