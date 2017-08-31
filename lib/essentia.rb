#
# load the compiled version of the C++ library along with everything else
#
module Essentia
  LIB_PATH = File.expand_path(File.join('..', 'essentia'), __FILE__)
  STANDARD_PATH = File.join(LIB_PATH, 'standard')
  STREAMING_PATH = File.join(LIB_PATH, 'streaming')
  STREAMING_ALGO_PATH = File.join(STREAMING_PATH, 'algorithms')
end

# essentia_streaming_ruby_wrap
# essentia_streaming_algorithms_ruby_wrap
# essentia_scheduler_ruby_wrap
%w(
  version
  essentia_ruby_wrap
  essentia_standard_ruby_wrap
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

##
## General miscellanea of things that do not fit anywhere else
##
#module Essentia
#
#  self << class
#
#    #
#    # +is_initialized?+
#    #
#    # is a convenience proxy for the +is_initialized()+ C++ method to better
#    # follow ruby conventions (until we know how to do it better through SWIG)
#    #
#    # We can't use +alias_method+ here, because it require constants as
#    # arguments
#    #
#    def is_initialized?
#      is_initialized
#    end
#
#  end
#
#end
