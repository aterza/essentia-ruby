module EssentiaRuby::Models
  MODEL_PATH = File.expand_path(File.join('..', 'models'), __FILE__)
end

%w(
  algorithm_factory
).each { |f| require File.join(EssentiaRuby::Models::MODEL_PATH, f) }
