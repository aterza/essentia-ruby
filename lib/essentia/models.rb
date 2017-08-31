module Essentia::Models
  MODEL_PATH = File.expand_path(File.join('..', 'models'), __FILE__)
end

%w(
  option_set
  option_manager
).each { |f| require File.join(Essentia::Models::MODEL_PATH, f) }
