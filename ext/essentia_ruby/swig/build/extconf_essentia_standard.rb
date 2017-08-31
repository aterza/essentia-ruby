__HERE__ = File.expand_path('..', __FILE__)

require File.join(__HERE__, 'extconf_common')
$objs = ['essentia_standard_wrap.o']

create_makefile('lib/essentia/essentia_standard_ruby_wrap')
