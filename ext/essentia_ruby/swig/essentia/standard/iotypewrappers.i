//
// SWIG Wrapper for essentia's types
//
%{
  #include "config.h"
  #include "iotypewrappers.h"
  #include "iotypewrappers_impl.h"
%}

%ignore essentia::standard::InputBase;
%ignore essentia::standard::OutputBase;

// %include typemaps.i
%include "config.h"
%include "iotypewrappers.h"
%include "iotypewrappers_impl.h"

// %extend essentia::standard::InputBase {
//   void set_real_vector(std::vector<essentia::Real>& rv) { $self->set(rv); }
// }
// 
// %extend essentia::standard::OutputBase {
//   void set_real_vector(std::vector<essentia::Real>& rv) { $self->set(rv); }
//   void set_real_output(essentia::RealNumber& rn) { $self->set(rn.number); }
// }
// 
// void essentia::standard::OutputBase::set_real_output(float *OUTPUT);
// 
// %template(RealVectorInput) essentia::standard::Input<std::vector<essentia::Real>>;
// %template(RealVectorOutput) essentia::standard::Output<std::vector<essentia::Real>>;
