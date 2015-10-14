require_relative 'game_model'
require_relative 'game_view'
require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class GameController

  attr_accessor :model, :view

  def initialize
    @model = GameModel.new
    @view = GameView.new
  end

  def play_game

    self.view.clear
    self.view.welcome_msg

    self.view.select_game_type_msg
    get_game_type_input

    self.view.clear
    get_player_markers_input

    self.view.clear
    self.view.get_first_player_msg(self.model.players[0].marker, self.model.players[1].marker)
    get_first_player_input

    play_loop

    self.view.clear
    self.view.show_board(self.model.final_board_state)

    result_communication

    self.view.thank_you_msg

  end

  def get_input
    gets.chomp
  end

  def get_game_type_input

    game_type = get_input

    if valid_game_type?(game_type)
      set_game_type(game_type)
    else
      puts self.view.retry_input_msg
      get_game_type_input
    end

  end

  def set_game_type(type)

    case type.to_i

    when 1
      self.model.add_human_player
      self.model.add_human_player

    when 2
      self.model.add_human_player
      self.model.add_computer_player
    when 3
      self.model.add_computer_player
      self.model.add_computer_player
    else
      nil
    end

  end

  def get_player_markers_input
    self.model.players.each_with_index do |player,i|
      player_number = i+1
      self.view.select_player_marker_msg(player_number, player.class)
      get_player_marker_input_for(player)
    end
  end

  def get_player_marker_input_for(player)
    while player.marker == nil
      player_marker = get_input

      if is_a_duplicate_marker?(player_marker)
        self.view.already_selected_msg
        get_player_marker_input_for(player)
      else
        valid = player.set_marker(player_marker)

        unless valid
          self.view.retry_input_msg
        end
      end
    end
  end

  def get_first_player_input
    marker = get_input

    player = self.model.get_player_by_marker(marker)

    if player != nil
      self.model.current_player = player
    else
      self.view.retry_input_msg
      get_first_player_input
    end
  end

  def play_loop
    until self.model.game_over?
      self.view.clear

      self.view.current_turn_msg(self.model.current_player.marker)

      self.view.show_board(self.model.board_content)

      last_move_communication

      if self.model.current_player.class == HumanPlayer
        self.view.get_move_msg(self.model.current_player.marker)
      end

      move_location = get_move_location(self.model.current_player)

      valid = self.model.add_to_board(move_location, self.model.current_player.marker)

      self.model.store_move(move_location)

      self.model.switch_player
    end
  end

  def last_move_communication
    if (self.model.moves.length > 0)
        last_move_location = self.model.moves[-1][:location]
        last_move_player_marker = self.model.moves[-1][:player].marker
        self.view.move_msg(last_move_location, last_move_player_marker)
    end
  end

  def get_move_location(player)

    if player.class == HumanPlayer

      move_location = get_input

      valid_status = self.model.validate_move_location(move_location)

      if valid_status
        return move_location.to_i
      else
        self.view.retry_input_msg
        return get_move_location(player)
      end

    elsif(player.class == ComputerPlayer)
      return player.choose_location(self.model.board)
    end
  end

  def result_communication
    if self.model.winner_exists?
      self.view.winner_msg(self.model.winner_marker)
    else
      self.view.cat_game_msg
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

