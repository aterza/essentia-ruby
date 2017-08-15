module EssentiaRuby::Helpers
  HELPER_PATH = File.expand_path(File.join('..', 'helpers'), __FILE__)
end

%w(
  common_creator
  mono_loader
  common_algorithm_interface
  dissonance
).each { |f| require File.join(EssentiaRuby::Helpers::HELPER_PATH, f) }
