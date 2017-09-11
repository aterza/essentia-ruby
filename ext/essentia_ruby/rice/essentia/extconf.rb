require 'mkmf-rice'

output_name = 'essentia_ruby_wrap'
$objs = %w(
        io_base.o
        io.o
        algorithm.o
        vectors.o
        description_map.o
        exception.o
        types.o
        setup.o
        modules.o
        init.o
)

ESSENTIA_LOCAL_DIR = File.expand_path(File.join(['..'] * 3, 'essentia'), __FILE__)
ESSENTIA_RUBY_DIR = File.expand_path(File.join(['..'] * 5, 'lib'), __FILE__)
LIBDIR      = RbConfig::CONFIG['libdir']
INCLUDEDIR  = RbConfig::CONFIG['includedir']

HEADER_DIRS = [
  # First search locally
  File.join(ESSENTIA_LOCAL_DIR, 'src'),
  File.join(ESSENTIA_LOCAL_DIR, 'src', 'essentia'),

  # Then search /opt/local for macports
  '/opt/local/include',

  # Then search /usr/local for people that installed from source
  '/usr/local/include',

  # Check the ruby install locations
  INCLUDEDIR,

  # Finally fall back to /usr
  '/usr/include',
]

LIB_DIRS = [
  # First search locally
  File.join(ESSENTIA_LOCAL_DIR, 'build', 'src'),

  # Then search /opt/local for macports
  '/opt/local/lib',

  # Then search /usr/local for people that installed from source
  '/usr/local/lib',

  # Check the ruby install locations
  LIBDIR,

  # Finally fall back to /usr
  '/usr/lib',
]

with_cflags("-x c++") do
  dir_config('essentia', HEADER_DIRS, LIB_DIRS)
  res0 = find_header('ruby.h')
  res1 = find_header('essentia/essentia.h')
  res2 = have_library('essentia')
  abort 'Something went wrong: please check mkmf.log' unless (res0 && res1 && res2)
end

$CXX = 'clang++ -std=c++1y'
$warnflags.gsub!(/ -Wno-packed-bitfield-compat/, '')

create_makefile(output_name)
