require_relative 'player'
require_relative 'code'

require 'colorize'

class Game
  
  def initialize
    @secret_code = Code.new
    @guesser = Player.new
    @remaining_turns = 12
    @board = Board.new
  end

  def play
    @remaining_turns.times do
      loop do
        puts "Please pick 4 colors from #{Code::COLORS}"
        guess = @guesser.make_guess
        if guess_is_valid?(guess)
          break
        end
        puts 'Please enter valid choices'.red
      end
    end
  end

  private

  def guess_is_valid?(guess)
    guess.size == 4 && guess.all? { |color| Code::COLORS.include?(color) }
  end
end
