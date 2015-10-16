require_relative 'game_model'
require_relative 'game_view'
require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'
require_relative 'ui'

class GameController

  attr_accessor :model, :view, :ui

  def initialize
    @model = GameModel.new
    @view = GameView.new
    @ui = UI.new
  end

  def play_game

    ui.give(view.clear)
    ui.give(view.welcome_msg)
    ui.give(view.select_game_type_msg)

    game_type = get_game_type
    set_game_type(game_type)

    ui.give(view.clear)

    get_player_markers_input


    message = view.get_first_player_msg(model.players[0].marker, model.players[1].marker)
    ui.give(message)

    get_first_player_input

    play_loop

    ui.give(view.clear)
    ui.give(view.show_board(model.final_board_state))

    result_communication

    ui.give(view.thank_you_msg)

  end

  def get_game_type(game_type = ui.receive)
    if valid_game_type?(game_type)
      game_type
    else
      ui.give(view.retry_input_msg)
      get_game_type
    end
  end

  def set_game_type(type)

    case type.to_i

    when 1
      model.add_human_player
      model.add_human_player

    when 2
      model.add_human_player
      model.add_computer_player
    when 3
      model.add_computer_player
      model.add_computer_player
    else
      nil
    end

  end

  def get_player_markers_input
    model.players.each_with_index do |player,i|
      player_number = i+1
      message = view.select_player_marker_msg(player_number, player.class)
      ui.give(message)
      get_player_marker_input_for(player)
    end
  end

  def get_player_marker_input_for(player)
    while player.marker == nil
      player_marker = ui.receive

      if is_a_duplicate_marker?(player_marker)
        ui.give(view.already_selected_msg)
        get_player_marker_input_for(player)
      else
        valid = player.set_marker(player_marker)

        unless valid
          ui.give(view.retry_input_msg)
        end
      end
    end
  end

  def get_first_player_input(marker =ui.receive)

    player = model.get_player_by_marker(marker)

    if player != nil
      model.current_player = player
    else
      ui.give(view.retry_input_msg)
      get_first_player_input
    end
  end

  def play_loop
    until model.game_over?
      ui.give(view.clear)

      ui.give(view.current_turn_msg(model.current_player.marker))

      ui.give(view.show_board(model.board_content))

      last_move_communication

      if model.current_player.class == HumanPlayer
        marker = model.current_player.marker
        message = view.get_move_msg(marker)
        ui.give(message)
      end

      move_location = get_move_location(model.current_player)

      valid = model.add_to_board(move_location, model.current_player.marker)

      model.store_move(move_location)

      model.switch_player
    end
  end

  def last_move_communication
    if (model.moves.length > 0)
        last_move_location = model.moves[-1][:location]
        last_move_player_marker = model.moves[-1][:player].marker
        view.move_msg(last_move_location, last_move_player_marker)
    end
  end

  def get_move_location(player)

    if player.class == HumanPlayer

      move_location = ui.receive

      valid_status = model.validate_move_location(move_location)

      if valid_status
        return move_location.to_i
      else
        ui.give(view.retry_input_msg)
        return get_move_location(player)
      end

    elsif(player.class == ComputerPlayer)
      return player.choose_location(model.board)
    end
  end

  def result_communication
    if model.winner_exists?
     ui.give(view.winner_msg(model.winner_marker))
    else
     ui.give(view.cat_game_msg)
    end
  end

  def valid_game_type?(input)
    input = input.to_i

    if input == 1 || input == 2 || input == 3
      return true
    else
      return false
    end
  end

  def is_a_duplicate_marker?(player_marker)
    search_result = model.get_player_by_marker(player_marker)
    if search_result == nil
      false
    else
      true
    end
  end

end

