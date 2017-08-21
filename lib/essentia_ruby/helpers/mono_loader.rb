module EssentiaRuby
  module Helpers

    module MonoLoader

      class << self

        DEFAULT_MONOLOADER_OPTIONS = { 'sampleRate' => 44100, 'downmix' => 'mix' }
  
        #
        # <tt>create(filename, om, options = {})</tt>
        #
        # Arguments:
        # * +filename+: the audio file to be read
        # * +om+: the option manager to be used
        # * +options+: the set of runtime options (optional)
        #
        # return a configured MonoLoader algorithm suitable to be used in
        # streaming configurations. Its output can be retrieved like this:
        #
        # ```ruby
        # om = EssentiaRuby::OptionManager.new
        # ml = create(filename, om, options)
        # connect(ml.output('audio'), whatever_sink)
        # ```
        # where +ml+ is the +MonoLoader+ algorithm instance, while
        # +audio_output+ is an <tt>EssentiaRuby::RealVector</tt> which
        # will contain the output samples
        #
        def create(filename, om, options = {})
          tag = MonoLoader.algorithm_name
          options.update('filename' => filename)
          om.handle_defaults(tag, DEFAULT_MONOLOADER_OPTIONS)
          om.handle_runtime_options({ tag => options })
          EssentiaRuby::Helpers::CommonCreator.create(tag, om)
        end

      end

# TODO: stand-alone algorithms must be moved in their 'stand_alone' directory
#     #
#     # <tt>mono_loader(filename, sink, options = {})</tt>
#     #
#     # stand alone mono_loader helper. If you need just the mono loader, just use
#     # the +create_mono_loader+.
#     #
#     # It reads an audio file from +filename+, downmixes to mono, resamples it if
#     # the input sample rate does not match the desired output sample rate.
#     #
#     # Arguments
#     # - the output sink
#     # - a hash of options with the following first level fields (all optional):
#     # - +downmix+: 'left', 'right' or 'mix' (default)
#     # - +sampleRate+: the output sampling rate (default: 44100)
#     #
#     # Output
#     # - the mono loader itself
#     #

#     def mono_loader(filename, sink, options = {})
#       om = EssentiaRuby::OptionManager.new
#       ml = create_mono_loader(filename, om, options)
#       connect(ml.output('audio'), sink)
#       n = EssentiaRuby::Network.new(ml)
# 
#       n.run

#       ml
#     end
    end

  end
end
