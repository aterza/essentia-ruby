#
# SWIG rake tasks to compile the essentia library
#
namespace :swig do

  desc 'generate ruby wrapper for the C++ essentia library'
  task :generate do
    EXT_PATH = File.expand_path(File.join(['..'] * 3, 'ext', 'essentia_ruby'), __FILE__)
    SWIG_PATH = File.join(EXT_PATH, 'swig')
    ESSENTIA_PATH = File.join(EXT_PATH, 'essentia')
    Dir.chdir(SWIG_PATH) do
      sh("swig -v -Wall -I. -I#{ESSENTIA_PATH}/src/essentia -I#{ESSENTIA_PATH}/src/algorithms/ -c++ -ruby -o ../essentia_wrap.cxx essentia.i")
    end
  end

end
