#
# SWIG rake tasks to compile the essentia library
#
namespace :swig do

  desc 'create ruby wrapper for the C++ essentia library'
  task :compile do
    EXT_PATH = File.expand_path(File.join(['..'] * 3, 'ext', 'essentia_ruby'), __FILE__)
    Dir.chdir(EXT_PATH) do
      sh('swig -I. -I./essentia/src/essentia -I./essentia/src/algorithms/tonal/ -c++ -ruby essentia.i')
    end
  end

end
