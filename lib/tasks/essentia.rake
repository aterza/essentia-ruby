#
# rake tasks to compile the audio fixtures for the spec tests
#
namespace :essentia do

  namespace :audio do

    desc 'generate the audio fixtures for the spec tests'
    task :generate do
      FIXTURE_SOURCES_PATH = File.expand_path(File.join(['..'] * 3, 'spec', 'fixtures', 'audio', 'src'), __FILE__)
      Dir.chdir(FIXTURE_SOURCES_PATH) do
        Dir.glob(File.join('.', '*.csd')).each do
          |csd|
          basename = File.basename(csd, '.csd')
          audio_file = basename + '.wav'
          sh("csound -dWo ../#{audio_file} #{csd}")
        end
      end
    end

  end

end
