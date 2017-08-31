module Essentia::Helpers
  HELPER_PATH = File.expand_path(File.join('..', 'helpers'), __FILE__)
end

require File.expand_path(File.join(['..'] * 2, 'extensions', 'module'), __FILE__)

%w(
  common_creator
  mono_loader
  spectral
  common_algorithm_interface
  PC
  dissonance
).each { |f| require File.join(Essentia::Helpers::HELPER_PATH, f) }
