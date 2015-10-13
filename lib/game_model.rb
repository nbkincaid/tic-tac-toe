class GameModel

  attr_accessor :board, :players, :moves, :current_player

  def initialize
    @board = Board.new(["0", "1", "2", "3", "4", "5", "6", "7", "8"])
    @players = []
    @moves = []
    @current_player = nil
  end


end