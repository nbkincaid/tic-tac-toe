class GameModel

  attr_accessor :current_player
  attr_reader :board, :players, :moves

  def initialize
    @board = Board.new(["0", "1", "2", "3", "4", "5", "6", "7", "8"])
    @current_player = nil
    @players = []
    @moves = []
  end

  def switch_player
    current_player_index = players.index(current_player)

    if current_player_index == 0
      self.current_player = players[1]
    elsif current_player_index == 1
      self.current_player = players[0]
    end
  end

  def final_board_state
    board.clear_state
  end

  def winner_exists?
    board.three_in_a_row?
  end

  def winner_marker
    board.three_in_a_row_marker
  end

  def board_content
    board.squares
  end

  def add_to_board(location, marker)
    board.place_marker(location, marker)
  end

  def validate_move_location(move_location)
    is_numeric_status = (move_location =~ /\A\d+\Z/)
    is_valid_status = board.valid_location?(move_location.to_i)

    is_numeric_status && is_valid_status
  end

  def store_move(location)
    self.moves << {player: current_player, location: location}
  end

  def set_players(game_type)
    players = []

    case game_type.to_i

    when 1
      add_human_player
      add_human_player
    when 2
      add_human_player
      add_computer_player
    when 3
      add_computer_player
      add_computer_player
    else
      nil
    end
  end

  def get_player_by_marker(marker)
    players.find{|player| player.marker == marker}
  end

  def game_over?
    board.three_in_a_row? || board.squares_full?
  end

  private

  attr_writer :board, :players, :moves

  def add_human_player
    players << HumanPlayer.new
  end

  def add_computer_player
    players <<  ComputerPlayer.new
  end
end