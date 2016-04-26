/*
 * this code was written by Nicola Bernardini
 *
 * The same license that applies to the Essentia library applies to this
 * portion of code too.
 *
 * This file contains some extra wrappers that are needed to make the
 * templated math functions work. They will be added as the need will grow.
 *
 */

#if !defined(_ESSENTIAMATH_WRAPS_H_)
#define _ESSENTIAMATH_WRAPS_H_

inline essentia::Real real_vector_instant_power(const std::vector<essentia::Real>& array)
{
  return essentia::energy<essentia::Real>(array) / array.size();
}

inline bool real_vector_is_silent(const std::vector<essentia::Real>& array)
{
  return real_vector_instant_power(array) < silenceCutoff;
}

#endif /* !defined(_ESSENTIAMATH_WRAPS_H_) */
