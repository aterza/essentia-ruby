require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :spec => 'essentia:audio:generate'
#
# if we do not clobber the whole thing the process will not recompile
#
desc 'rebuild the ruby wrapper for essentia from scratch'
task :compile => [:clobber, 'compile:essentia_ruby_wrap']

require "rake/extensiontask"

EXT_DIR = File.join('ext', 'essentia_ruby', 'rice', 'essentia')
LIB_DIR = File.join('lib', 'essentia')

Rake::ExtensionTask.new('essentia_ruby_wrap') do
  |ext|
  ext.ext_dir = EXT_DIR
  ext.lib_dir = LIB_DIR
end

#
# What follows is an antique relic of a (failed) wrapping attempt with SWIG
# and will be removed as soon as we are sure that rice works
#
#EXTENSIONS =
#{
#  'essentia_ruby_wrap' => 'extconf_essentia.rb',
#  'essentia_standard_ruby_wrap' => 'extconf_essentia_standard.rb',
## 'essentia_streaming_ruby_wrap' => 'extconf_essentia_streaming.rb',
## 'essentia_streaming_algorithms_ruby_wrap' => 'extconf_essentia_streaming_algorithms.rb',
## 'essentia_scheduler_ruby_wrap' => 'extconf_essentia_scheduler.rb',
#}
#
#EXTENSIONS.each do
#  |k, v|
#  Rake::ExtensionTask.new(k) do |ext|
#    ext.config_script = v
#    ext.ext_dir = EXT_DIR
#    ext.lib_dir = LIB_DIR
#  end
#end

Dir.glob(File.join('.', 'lib', 'tasks', '*.rake')).each { |f| load f }
