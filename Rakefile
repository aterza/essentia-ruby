require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
task :compile => 'swig:compile'

require "rake/extensiontask"

Rake::ExtensionTask.new('essentia_ruby') do |ext|
  ext.lib_dir = "lib/essentia_ruby"
end

Dir.glob(File.join('.', 'lib', 'tasks', '*.rake')).each { |f| load f }
