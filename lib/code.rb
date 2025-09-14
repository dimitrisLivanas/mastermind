require 'colorize'

class Code
attr_reader :code
COLORS = ['red'.red, 'blue'.blue, 'green'.green, 'yellow'.yellow, 'purple'.magenta]

  def initialize
    @code = COLORS.sample(4)
  end

end
