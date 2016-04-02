require "mkmf"


version_dir = File.expand_path(File.join('..', 'essentia', 'src'), __FILE__)
essentia_dir = File.join(version_dir, 'essentia')

$defs.unshift("-iquote #{version_dir}")
$defs.unshift("-I#{essentia_dir}")
$defs.push('-I/usr/include/tcl')

create_makefile("./essentia_ruby")
