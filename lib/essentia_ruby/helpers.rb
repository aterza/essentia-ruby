module EssentiaRuby::Helpers
  HELPER_PATH = File.expand_path(File.join('..', 'helpers'), __FILE__)
end

%w(
  mono_loader
  dissonance
).each { |f| require File.join(EssentiaRuby::Helpers::HELPER_PATH, f) }
