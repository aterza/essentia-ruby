#
# SWIG rake tasks to compile the essentia library
#
namespace :swig do

  desc 'generate ruby wrapper for the C++ essentia library'
  task :generate do
    EXT_PATH = File.expand_path(File.join(['..'] * 3, 'ext', 'essentia_ruby', 'swig'), __FILE__)
    Dir.chdir(EXT_PATH) do
      sh('swig -v -Wall -I. -I../essentia/src/essentia -I../essentia/src/algorithms/ -c++ -ruby -o ../essentia_wrap.cxx essentia.i')
    end
  end

end
