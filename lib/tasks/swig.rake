#
# SWIG rake tasks to compile the essentia library
#
namespace :swig do

  PROJECT_NAME = 'essentia'
  ROOT_PATH = File.expand_path(File.join(['..'] * 3), __FILE__)
  EXT_PATH = File.join(ROOT_PATH, 'ext', "#{PROJECT_NAME}_ruby")
  SWIG_PATH = File.join(EXT_PATH, 'swig')
  ESSENTIA_PATH = File.join(EXT_PATH, PROJECT_NAME)
  PROXY_PATH = File.join(ROOT_PATH, 'lib', PROJECT_NAME, 'proxies')
  INTERFACE_FILES = Dir.glob(File.join(SWIG_PATH, '*.i'))

  namespace :generate do

      interface_files = INTERFACE_FILES
      interface_files.each do
        |ifile|
        wrapper_name = File.basename(ifile, '.i')
        output_file = wrapper_name + '_wrap.cpp'
        init_name = "#{wrapper_name}_ruby_wrap"
        desc "generate ruby wrapper for #{wrapper_name} module the C++ essentia library"
        task output_file do
          Dir.chdir(SWIG_PATH) do
            next if uptodate?(output_file, ifile)
            sh("swig -v -Wall -I. -I#{ESSENTIA_PATH}/src/essentia -I#{ESSENTIA_PATH}/src/algorithms/ -c++ -ruby -outdir #{PROXY_PATH} -minherit -initname #{init_name} -o ../#{output_file} #{ifile}")
          end
        end
      end

  end

  desc 'generate all the wrappers for the C++ essentia library'
  task :generate => INTERFACE_FILES.map { |f| "swig:generate:%s_wrap.cpp" % File.basename(f, '.i') }

end
