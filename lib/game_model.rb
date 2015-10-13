class GameModel

  attr_accessor :board, :players, :moves, :current_player

  def initialize
    @board = Board.new(["0", "1", "2", "3", "4", "5", "6", "7", "8"])
    @players = []
    @moves = []
    @current_player = nil
  end

  def final_board_state
    self.board.clear_state
  end

  def winner_exists?
    self.board.three_in_a_row?
  end

  def winner
    self.board.three_in_a_row_marker
  end

  def board_content
    self.board.squares
  end

  def add_to_board(location, marker)
    self.board.place_marker(location, marker)
  end

  def validate_move_location(move_location)
    is_numeric_status = (move_location =~ /\A\d+\Z/)
    is_valid_status = self.board.valid_location?(move_location.to_i)

    is_numeric_status && is_valid_status
  end

  def store_move(player, location)
    self.moves << {player: player, location: location}
  end

  def add_human_player
    self.players << HumanPlayer.new
  end

  def add_computer_player
    add_computer_player << ComputerPlayer.new
  end

  def get_player_by_marker(marker)
    self.players.find{|player| player.marker == marker}
  end

  def game_over?
    self.board.three_in_a_row? || self.board.squares_full?
  end

end