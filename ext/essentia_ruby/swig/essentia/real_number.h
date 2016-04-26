#if !defined(_ESSENTIA_REAL_NUMBER_H_)
#define _ESSENTIA_REAL_NUMBER_H_

#include "types.h"

namespace essentia {

  //
  // essentia::RealNumber is a hack to try to pass real number references to
  // the code when needed
  //
  struct RealNumber {

  public:
    Real number;

    RealNumber()         : number(0.0) {}
    RealNumber(Real num) : number(num) {}

    Real get() { return number; }
    Real set(Real num) { return (number = num); }
  };

}

#endif /* !defined(_ESSENTIA_REAL_NUMBER_H_) */
