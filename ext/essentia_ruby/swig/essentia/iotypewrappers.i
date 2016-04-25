//
// SWIG Wrapper for essentia's types
//
%{
  #include "iotypewrappers.h"
  #include "iotypewrappers_impl.h"
%}

%include "config.h"
%include "iotypewrappers.h"
%include "iotypewrappers_impl.h"

%extend essentia::standard::InputBase {
  void set_real_vector(std::vector<essentia::Real>& rv) { $self->set(rv); }
}

%extend essentia::standard::OutputBase {
  void set_real_vector(std::vector<essentia::Real>& rv) { $self->set(rv); }
}

%template(RealInput) essentia::standard::Input<std::vector<essentia::Real>>;
%template(RealOutput) essentia::standard::Output<std::vector<essentia::Real>>;
