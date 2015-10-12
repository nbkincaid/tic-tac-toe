require_relative 'board'
require_relative 'game_view'
require_relative 'human_player'

class Game
  def initialize
    @board = Board.new(["0", "1", "2", "3", "4", "5", "6", "7", "8"])
    @view = GameView.new
    @players = []
    @moves = []
    @current_player = nil
  end

  def play_game

    @view.clear
    @view.welcome_msg

    @view.select_game_type_msg
    get_game_type_input

    @view.clear
    get_player_markers_input

    @view.clear
    @view.get_first_player_msg(@players[0].marker, @players[1].marker)
    get_first_player_input

    play_loop

    @view.clear
    @view.show_board(@board.clear_state)

    result_communication

    @view.thank_you_msg

  end

  def result_communication
    if @board.three_in_a_row?
      @view.winner_msg(@board.three_in_a_row_marker)
    else
      @view.cat_game_msg
    end
  end

  def play_loop
    until game_over?
      @view.clear
      @view.show_board(@board.state)

      last_move_communication

      @view.get_move_msg(@current_player.marker)

      move_location = get_move_location(@current_player)

      valid = @board.place_marker(move_location, @current_player.marker)

      store_move(@current_player, move_location)

      switch_player
    end
  end

  def last_move_communication
    if (@moves.length > 0)
        last_move_location = @moves[-1][:location]
        last_move_player_marker = @moves[-1][:player].marker
        @view.move_msg(last_move_location, last_move_player_marker)
    end
  end

  def switch_player
    current_player_index = @players.index(@current_player)

    if current_player_index == 0
      @current_player = @players[1]
    elsif current_player_index == 1
      @current_player = @players[0]
    end

  end

  def get_move_location(player)

    if player.class == HumanPlayer

      move_location = get_input

      valid_status = validate_move_location(move_location)

      if valid_status
        return move_location.to_i
      else
        @view.retry_input_msg
        return get_move_location(player)
      end

    # else if(player.class == ComputerPlayer)
    end
  end

  def validate_move_location(move_location)
    is_numeric_status = (move_location =~ /\A\d+\Z/)
    is_valid_status = @board.valid_location?(move_location.to_i)

    is_numeric_status && is_valid_status
  end

  def store_move(player, location)
    @moves << {player: player, location: location}
  end

  def get_game_type_input

    game_type = get_input

    if valid_game_type?(game_type)
      set_game_type(game_type)
    else
      puts @view.retry_input_msg
      get_game_type_input
    end

  end

  def get_input
    gets.chomp
  end

  def valid_game_type?(input)
    input = input.to_i

    if input == 1 || input == 2 || input == 3
      return true
    else
      return false
    end
  end


  def set_game_type(type)

    case type.to_i

    when 1
      @players << HumanPlayer.new
      @players << HumanPlayer.new
    # when 2
    #   @players << HumanPlayer.new
    #   @players << ComputerPlayer.new
    # when 3
    #   @players << ComputerPlayer.new
    #   @players << ComputerPlayer.new
    else

    end

  end

  def get_player_markers_input
    @players.each_with_index do |player,i|
      player_number = i+1
      @view.select_player_marker_msg(player_number, player.class)
      get_player_marker_input_for(player)
    end
  end

  def get_player_marker_input_for(player)

    while player.marker == nil
      player_marker = get_input

      if is_a_duplicate_marker?(player_marker)
        @view.already_selected_msg
        get_player_marker_input_for(player)
      else
        valid = player.set_marker(player_marker)

        unless valid
          @view.retry_input_msg
        end
      end
    end

  end

  def is_a_duplicate_marker?(player_marker)
    search_result = find_player_by_marker(player_marker)
    if search_result == nil
      false
    else
      true
    end
  end

  def find_player_by_marker(marker)
    @players.find{|player| player.marker == marker}
  end

  def get_first_player_input
    marker = get_input

    player = find_player_by_marker(marker)

    if player != nil
      @current_player = player
    else
      @view.retry_input_msg
      get_first_player_input
    end
  end

  def game_over?
    @board.three_in_a_row? || @board.squares_full?
  end

end

game = Game.new
game.play_game
