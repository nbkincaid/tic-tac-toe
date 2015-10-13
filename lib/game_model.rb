class GameModel

  attr_accessor :board, :players, :moves, :current_player

  def initialize
    @board = Board.new(["0", "1", "2", "3", "4", "5", "6", "7", "8"])
    @current_player = nil
    @players = []
    @moves = []
  end

  def switch_player
    current_player_index = self.players.index(self.current_player)

    if current_player_index == 0
      self.current_player = self.players[1]
    elsif current_player_index == 1
      self.current_player = self.players[0]
    end

  end

  def final_board_state
    self.board.clear_state
  end

  def winner_exists?
    self.board.three_in_a_row?
  end

  def winner_marker
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

  def store_move(location)
    self.moves << {player: self.current_player, location: location}
  end

  def add_human_player
    self.players << HumanPlayer.new
  end

  def add_computer_player
    self.players <<  ComputerPlayer.new
  end

  def get_player_by_marker(marker)
    self.players.find{|player| player.marker == marker}
  end

  def game_over?
    self.board.three_in_a_row? || self.board.squares_full?
  end

end