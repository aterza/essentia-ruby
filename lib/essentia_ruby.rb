#
# load the compiled version of the C++ library along with everything else
#
module EssentiaRuby
  LIB_PATH = File.expand_path(File.join('..', 'essentia_ruby'), __FILE__)
end

%w(
  version
  essentia_ruby
  helpers
  models
).each { |f| require File.join(EssentiaRuby::LIB_PATH, f) }

EssentiaRuby.include(Essentia_ruby)

include EssentiaRuby
