# EssentiaRuby

TODO: Write a gem description

## Installation

In order to make this work, you have to run the following command--line
commands:

```bash
#
# this loads the submodule repositories
#
$ git submodule update --init 'ext/essentia_ruby/essentia'        # the actual essentia library
$ git submodule update --init 'ext/essentia_ruby/essentia-audio'  # the audio test samples
$ cd ext/essentia_ruby/essentia
$ ./wav configure --mode=release --build_static
$ ./wav # this takes quite a while
```

After this you can run the tests to verify that everything is in place:

```bash
$ rake
```

If everything is ok you should be good to go.

Add this line to your application's Gemfile:

```ruby
gem 'essentia_ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install essentia_ruby

## Usage

`essentia_ruby` has heplers that can be used as methods or functions to run
the desired analysis algorithm. You are welcome to add more helpers.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/essentia_ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
