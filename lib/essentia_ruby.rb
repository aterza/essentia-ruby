require "essentia_ruby/version"
#
# load the compiled version of the C++ library
#
EXT_INSTALL_PATH = Dir.glob(File.expand_path(File.join(['..'] * 2, 'tmp', '*', 'stage', 'lib', 'essentia_ruby'), __FILE__))
require File.join(EXT_INSTALL_PATH, 'essentia_ruby')

module EssentiaRuby

  include Essentia_ruby

end
