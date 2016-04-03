# How to create and compile the SWIG wrapper

* Create the `c++` wrapper with the following command:
```sh
$ swig -I. -I./essentia/src/essentia -I./essentia/src/algorithms/tonal/ -c++ -ruby types.i
```
* Create the `Makefile` with the following command:
```sh
$ ruby extconf.rb
```
* Compile the wrapper:
```sh
$ make
```
* Rapid test if the wrapper is doing the proper work:
  ```sh
  $ ruby -I. -e "require 'essentia_ruby'; puts defined?(Essentia_ruby::<type>).to_s"
  ```
  (substitute `<type>` with whatever class you are trying to wrap). This
  should return `"constant"` or `"method"` if it works, and a blank line if it
  doesn't.
