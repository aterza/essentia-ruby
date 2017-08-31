module Essentia

  module Models

    class OptionSet
  
      attr_reader :tag, :default_hash
      attr_accessor :runtime_hash
  
      def initialize(t, dh, rh = {})
        @tag = t.to_s
        @default_hash = dh
        self.runtime_hash = rh
        @parameters = []
      end
  
      def to_essentia_parameters
        setup if @parameters.empty?
        @parameters.flatten
      end
  
    private
  
      #
      # +setup+
      #
      # The +setup+ private method prepares the hashes of options (merging the
      # default with the runtime ones) to be used as parameters by Essentia
      #
      def setup
        opts = Marshal.load(Marshal.dump(self.default_hash)) # deep hash copy
        opts.merge!(self.runtime_hash)
        opts.each do
          |k, v|
          @parameters << [ k.to_s, (erp = Essentia::Parameter.new(v)) ]
          self.class.send(:define_method, k) { erp }
        end
      end
  
    end

  end

end
