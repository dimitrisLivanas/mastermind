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

  def exact_matches(guess, secret_code)
    counter = 0
    guess.each_with_index { |color, index| counter += 1 if guess[index] == secret_code[index] }
    counter
  end

  def partial_matches(guess, secret_code)
    counter = 0
    guess_copy = guess.dup
    secret_copy = secret_code.dup
    guess_copy.each_with_index do |color, index|
      if guess_copy[index] == secret_copy[index]
        guess_copy[index] = nil
        secret_copy[index] = nil
      end
    end
    guess_copy.each do |color|
      if secret_copy.include?(color)
        counter += 1
        secret_copy[secret_copy.index(color)] = nil
      end
    end
    counter
  end
end
