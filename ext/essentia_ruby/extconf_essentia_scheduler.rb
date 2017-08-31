__HERE__ = File.expand_path('..', __FILE__)

require File.join(__HERE__, 'extconf_common')
$objs = ['essentia_scheduler_wrap.o']

create_makefile('lib/essentia/essentia_scheduler_ruby_wrap')
