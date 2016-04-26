require 'byebug'
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'essentia_ruby'

AUDIO_DIR = File.expand_path(File.join(['..'] * 2, 'ext', 'essentia_ruby', 'essentia-audio'), __FILE__)
AUDIO_FIXTURES_DIR = File.expand_path(File.join('..', 'fixtures', 'audio'), __FILE__)
