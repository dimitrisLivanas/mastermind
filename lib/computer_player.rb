require_relative 'code'

class ComputerPlayer
  def make_guess
    computer_guess = Code::COLOR_NAMES.sample(4)
  end
end