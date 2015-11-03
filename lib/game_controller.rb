require_relative 'game_model'
require_relative 'game_view'
require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'
require_relative 'ui'
require_relative 'board_analyzer_module'

class GameController
  include UI

  def initialize
    @model = GameModel.new
    @view = GameView.new
  end

  def play_game
    give(view.clear)
    give(view.welcome_msg)
    give(view.select_game_type_msg)

    game_type = nil
    until valid_game_type?(game_type)
      game_type = get_game_type
    end
    model.set_players(game_type)

    give(view.clear)

    get_player_markers_input

    message = view.get_first_player_msg(model.players[0].marker, model.players[1].marker)
    give(message)

    get_first_player_input

    play_loop

    give(view.clear)
    give(view.show_final_board(model.board.squares))

    result_communication

    give(view.thank_you_msg)

  end

  private

  attr_accessor :model, :view, :ui

  def get_game_type(game_type = receive)

    game_type = game_type.to_i

    if valid_game_type?(game_type)
      game_type
    else
      give(view.retry_input_msg)
      nil
    end
  end

  def get_player_markers_input
    model.players.each_with_index do |player,i|
      player_number = i+1
      message = view.select_player_marker_msg(player_number, player.class)
      give(message)
      get_player_marker_input_for(player)
    end
  end

  def get_player_marker_input_for(player)
    while player.marker == nil
      player_marker = receive

      if is_a_duplicate_marker?(player_marker)
        give(view.already_selected_msg)
        get_player_marker_input_for(player)
      else
        valid = player.set_marker(player_marker)

        unless valid
          give(view.retry_input_msg)
        end
      end
    end
  end

  def get_first_player_input(marker = receive)

    player = model.get_player_by_marker(marker)

    if player != nil
      model.current_player = player
    else
      give(view.retry_input_msg)
      get_first_player_input
    end
  end

  def play_loop
    until model.game_over?
      give(view.clear)

      give(view.current_turn_msg(model.current_player.marker))

      give(view.show_board(model.board_content))

      last_move_communication

      marker = model.current_player.marker
      message = view.get_move_msg(marker)
      give(message)

      move_location = get_move_location(model.current_player)

      model.add_to_board(move_location, model.current_player.marker)

      model.store_move(move_location)

      model.switch_player
    end
  end

  def last_move_communication
    if (model.moves.length > 0)
      last_move_location = model.moves[-1][:location]
      last_move_player_marker = model.moves[-1][:player].marker
      give(view.move_msg(last_move_location, last_move_player_marker))
    end
  end

  def get_move_location(player)

    move_location = player.choose_location(model.board).to_i
    valid_status = model.validate_move_location(move_location)

    if valid_status
      return move_location.to_i
    else
      give(view.retry_input_msg)
      return get_move_location(player)
    end

  end

  def result_communication
    if model.winner_exists?
     give(view.winner_msg(model.winner_marker))
    else
     give(view.cat_game_msg)
    end
  end

  def valid_game_type?(input)
    input = input.to_i
    input == 1 || input == 2 || input == 3
  end

  def is_a_duplicate_marker?(player_marker)
    search_result = model.get_player_by_marker(player_marker)
    search_result != nil
  end

end

