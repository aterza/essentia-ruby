module Essentia

  module Models

    class OptionManager < Hash
  
      def <<(os)
        raise ArgumentError, "argument should be an OptionSet (it is a #{os.class} instead" unless os.is_a?(OptionSet)
        self.update(os.tag => os)
        self.class.send(:define_method, os.tag) { self[os.tag] }
      end
  
      #
      # <tt>handle_defaults(*args)</tt>
      #
      # handles several sets of option defaults doing all the dirty work of transforming
      # them into OptionSets etc.
      #
      # expects to find its arguments in tuplets:
      # tag (symbol or string), hash (defaults), tag, hash(defaults), etc. ...
      # It raises an ArgumentError exception if the arguments are not in
      # this form.
      #
      def handle_defaults(*args)
        raise ArgumentError, "arguments must be two or multiples of two" unless args.size > 0
        raise ArgumentError, "arguments must be multiples of two" unless (args.size % 2) == 0
        0.step(by: 2, to: args.size-2) do
           |n|
           raise ArgumentError, "arguments must be in the form: string (or symbol), hash, string (or symbol), hash, ... etc." unless (args[n].is_a?(String) || args[n].is_a?(Symbol)) && (args[n+1].is_a?(Hash)) && (args[n+1].is_a?(Hash))
           tag = args[n]
           dhash = args[n+1]
           os = OptionSet.new(tag, dhash)
           self << os
        end
      end
  
      #
      # <tt>handle_runtime_options(hh)</tt>
      #
      # install the runtime options inside the (already initialized)
      # +OptionManager+.
      #
      # Requires a hash of hashes as input, organized as:
      # { 'A' => { ... hash options for algorithm 'A' ...}, 'B' => { ...  # etc....} }
      #
      def handle_runtime_options(hh)
        error_msg = "argument must be an hash of hashes" 
        raise(ArgumentError, error_msg) unless hh.is_a?(Hash)
        hh.values.each { |v| raise(ArgumentError, error_msg + " (received #{v.inspect} instead") unless v.is_a?(Hash) }
        hh.each do
          |k, v|
          key = k.to_s
          raise(ArgumentError, "OptionSet \"#{key}\" not found") unless self.has_key?(key)
          os = self[key]
          os.runtime_hash = v
        end
      end
  
    end

  end

end
