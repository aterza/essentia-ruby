__HERE__ = File.expand_path('..', __FILE__)

require File.join(__HERE__, 'extconf_common')
$objs = ['essentia_streaming_wrap.o']

create_makefile('lib/essentia/essentia_streaming_ruby_wrap')
