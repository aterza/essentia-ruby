module EssentiaRuby::Models
  MODEL_PATH = File.expand_path(File.join('..', 'models'), __FILE__)
end

%w(
  option_set
  option_manager
  algorithm_factory
  dev_null
).each { |f| require File.join(EssentiaRuby::Models::MODEL_PATH, f) }
