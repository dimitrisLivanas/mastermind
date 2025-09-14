require_relative 'player'
require_relative 'code'

class Game
  
  def initialize
    @secret_code = Code.new
    @guesser = Player.new
    @remaining_turns = 12
    @board = Board.new
  end

  private

  def guess_is_valid?(guess)
    guess.size == 4 && guess.all? { |color| Code::COLORS.include?(color) }
  end
end
