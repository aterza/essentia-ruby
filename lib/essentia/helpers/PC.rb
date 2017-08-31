#
# <tt>Essentia::PC(pool, name)</tt>
#
# +PC+ is a shorthand for an initialization of an <tt>Essentia::PoolConnector</tt>
# It has been written to mimic the behaviour inside the +Essentia+ library
# itself. As such, it does not follow the normal conventions of ruby naming
# (capital letters are usually only used for constants).
#
# The +Essentia+ source code says:
# The reason why this function is defined with a const PC& as argument is described here:
# http://herbsutter.com/2008/01/01/gotw-88-a-candidate-for-the-most-important-const/
#
#

module Essentia

  class << self

    def PC(pool, name)
      Essentia::PoolConnector.new(pool, name)
    end

  end

end
