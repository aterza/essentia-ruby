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

* You just need to run:
```sh
$ rake compile
``
  this will run `swig`, create the wrapper and compile it for you.
* You may want to run the regression tests to check that all the `Essentia`
  classes were created
```sh
$ rake # (rspec is run by default)
```
