class HumanPlayer

  def make_guess
    gets.chomp.split(/[.,\s]+/)
  end

end