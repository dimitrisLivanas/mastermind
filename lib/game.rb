require_relative 'player'
require_relative 'code'

require 'colorize'

class Game
  
  def initialize
    @secret_code = Code.new
    @guesser = Player.new
    @remaining_turns = 12
  end

  def play
    prompt_game_mode_choice
    secret_code = @secret_code.code
    guess = nil
    @remaining_turns.times do
      loop do
        puts "Please pick 4 colors from: "
        puts "#{Code::COLORS.join(', ')}"
        guess = @guesser.make_guess
        if guess_is_valid?(guess)
          break
        end
        puts 'Please enter valid choices'.red
      end

      exact_matches_count = exact_matches(guess, secret_code)
      partial_matches_count = partial_matches(guess, secret_code)
      show_matches(exact_matches_count, partial_matches_count)

      if win?(guess, secret_code)
        puts 'You WIN! You got it! Congrats!'.green
        return
      end
    end

    puts 'You LOSE..You have no more tries.'.red
  end

  private

  def guess_is_valid?(guess)
    guess.size == 4 && guess.all? { |color| Code::COLOR_NAMES.include?(color) }
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
      if color != nil && secret_copy.include?(color)
        counter += 1
        secret_copy[secret_copy.index(color)] = nil
      end
    end
    counter
  end

  def show_matches(exact_matches, partial_matches)
    puts "You have (#{exact_matches}) exact matches and (#{partial_matches}) partial matches."
  end

  def win?(guess, secret_code)
    guess.eql?(secret_code)
  end

  def prompt_game_mode_choice
    puts 'Do you want to be the Code MAKER or the Code GUESSER? Enter 1 or 2 respectively.'
    loop do
      input = gets.chomp.to_i
      if input == 1 || input == 2
        return input
      end
      puts 'Please choose a valid option (Enter 1 or 2).'
    end
  end
end
