require 'colorize'

class Code
attr_reader :code
COLOR_NAMES = ['red', 'blue', 'green', 'yellow', 'purple']
COLORS = ['red'.red, 'blue'.blue, 'green'.green, 'yellow'.yellow, 'purple'.magenta]

  def initialize
    @code = COLOR_NAMES.sample(4)
  end
end
