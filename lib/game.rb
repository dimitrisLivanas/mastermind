class Game
  
  def initialize
    @secret_code = Code.new
    @guesser = Player.new
    @remaining_turns = 12
    @board = Board.new
  end

end

new_game = Game.new