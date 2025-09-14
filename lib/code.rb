class Code
attr_reader :code
COLORS = %w(red blue green yellow purple)

  def initialize
    @code = COLORS.sample(4)
  end

  def show_code
    self.code
  end
end

random_code = Code.new
print random_code.show_code