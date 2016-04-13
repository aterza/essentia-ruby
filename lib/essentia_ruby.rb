require "essentia_ruby/version"
#
# load the compiled version of the C++ library
#
EXT_INSTALL_PATH = Dir.glob(File.expand_path(File.join('..', 'essentia_ruby'), __FILE__))
require File.join(EXT_INSTALL_PATH, 'essentia_ruby')

EssentiaRuby.include(Essentia_ruby)
