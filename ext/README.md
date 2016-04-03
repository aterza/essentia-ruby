# How to bind the Essentia library with ruby

## How to compile the Essentia library in the first place

* Follow the instructions [here](http://essentia.upf.edu/documentation/installing.html) as far
  as pre-requisites etc. are concerning
* A good configuration recepie is:
  ```sh
  ./waf configure --mode=release --build-static --with-python --with-vamp
  ```
  (the configuration provided is long-winded and complicated and not needed
  for our purposes)
* then compile and link as per instructions
  ```sh
  ./waf
  ```

## How to compile the SWIG wrapper

* Create the `c++` wrapper with the following command:
```sh
$ swig -I. -I./essentia/src/essentia -I./essentia/src/algorithms/tonal/ -c++ -ruby essentia.i
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
