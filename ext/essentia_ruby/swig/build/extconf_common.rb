require "mkmf"

essentia_path = File.expand_path(File.join('..', 'essentia'), __FILE__)
swig_path = File.expand_path(File.join('..', 'swig'), __FILE__)
src_dir = File.join(essentia_path, 'src')
essentia_dir = File.join(src_dir, 'essentia')
essentia_swig_dir = File.join(swig_path, 'essentia')
lib_dir = File.join(essentia_path, 'build', 'src')
algorithms_dir = File.join(src_dir, 'algorithms')
streaming_algorithms_dir = File.join(essentia_dir, 'streaming', 'algorithms')
streaming_dir = File.join(essentia_dir, 'streaming')
scheduler_dir = File.join(essentia_dir, 'scheduler')

$defs.unshift("-I#{streaming_dir}")
$defs.unshift("-I#{scheduler_dir}")
$defs.unshift("-I#{algorithms_dir}")
$defs.unshift("-I#{streaming_algorithms_dir}")
$defs.unshift("-I#{essentia_dir}")
$defs.unshift("-iquote #{src_dir}")
$defs.push("-I#{essentia_swig_dir}")
$defs.push('-I/usr/include/tcl')
$LDFLAGS += " -L#{lib_dir}"
# $libs = append_library($libs, 'supc++') if RUBY_PLATFORM =~ /linux/
$libs = append_library($libs, 'z')
$libs = append_library($libs, 'fftw3f')
$libs = append_library($libs, 'avutil')
$libs = append_library($libs, 'avresample')
$libs = append_library($libs, 'avcodec')
$libs = append_library($libs, 'avformat')
$libs = append_library($libs, 'samplerate')
$libs = append_library($libs, 'yaml')
$libs = append_library($libs, 'tag_c')
$libs = append_library($libs, 'essentia')
# $objs = [ "essentia_wrap.o", "essentia_streaming_wrap.o", "essentia_scheduler_wrap.o", "essentia_streaming_algorithms_wrap.o", ]
# $CXXFLAGS += " -DSWIG_TYPE_TABLE=essentia"
# $LDFLAGS += " -Wl,-z,muldefs"
$CXXFLAGS += " -DDEBUGGING_ENABLED=0"
