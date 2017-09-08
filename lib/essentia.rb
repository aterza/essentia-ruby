#
# load the compiled version of the C++ library along with everything else
#
module Essentia
  LIB_PATH = File.expand_path(File.join('..', 'essentia'), __FILE__)
  STANDARD_PATH = File.join(LIB_PATH, 'standard')
  STREAMING_PATH = File.join(LIB_PATH, 'streaming')
  STREAMING_ALGO_PATH = File.join(STREAMING_PATH, 'algorithms')
end

%w(
  version
  essentia_ruby_wrap
  helpers
  models
).each { |f| require File.join(Essentia::LIB_PATH, f) }

%w(
  algorithm_factory
).each { |f| require File.join(Essentia::STANDARD_PATH, f) }

%w(
  algorithm_factory
).each { |f| require File.join(Essentia::STREAMING_PATH, f) }

%w(
  dev_null
).each { |f| require File.join(Essentia::STREAMING_ALGO_PATH, f) }
