require_relative 'board_analyzer_module'

class GameModel
  include BoardAnalyzer

  attr_accessor :current_player
  attr_reader :board, :players, :moves

  def initialize
    @board = Board.new
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

  def winner_exists?
    three_in_a_row?(board)
  end

  def winner_marker
    three_in_a_row_marker(board)
  end

  def board_content
    board.squares
  end

  def add_to_board(location, marker)
    board.place_marker(location, marker)
  end

  def validate_move_location(move_location)
    is_integer_status = move_location.is_a? Integer
    is_valid_status = board.valid_location?(move_location)

    is_integer_status && is_valid_status
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
    three_in_a_row?(board) || squares_full?(board)
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