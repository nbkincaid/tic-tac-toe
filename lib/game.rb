require_relative 'board'
require_relative 'game_view'
require_relative 'human_player'

class Game
  def initialize
    @board = Board.new
    @view = GameView.new
    @players = []
    @next_move = nil

    # @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    # @com = "X"
    # @hum = "O"
  end

  def play_game

    @view.welcome_msg

    @view.select_game_type_msg
    get_game_type_input

    get_player_markers_input

    @view.get_first_player_msg(@players[0].marker, @players[1].marker)
    get_first_player_input




    # puts "Welcome to my Tic Tac Toe game"
    # puts "|_#{@board[0]}_|_#{@board[1]}_|_#{@board[2]}_|\n|_#{@board[3]}_|_#{@board[4]}_|_#{@board[5]}_|\n|_#{@board[6]}_|_#{@board[7]}_|_#{@board[8]}_|\n"
    # puts "Please select your spot."
    # until game_is_over(@board) || tie(@board)
    #   get_human_spot
    #   if !game_is_over(@board) && !tie(@board)
    #     eval_board
    #   end
    #   puts "|_#{@board[0]}_|_#{@board[1]}_|_#{@board[2]}_|\n|_#{@board[3]}_|_#{@board[4]}_|_#{@board[5]}_|\n|_#{@board[6]}_|_#{@board[7]}_|_#{@board[8]}_|\n"
    # end
    # puts "Game over"
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

    player_marker = get_input

    if is_a_duplicate_marker?(player_marker)
      @view.already_selected_msg
      get_player_marker_input_for(player)
    end

    valid = player.set_marker(player_marker)

    if valid
      # @view.input_thank_you_msg
    else
      @view.retry_input_msg
      get_player_marker_input_for(player)
    end
  end


  def is_a_duplicate_marker?(player_marker)
    search_result = @players.find{|player| player.marker == player_marker}

    if search_result == nil
      false
    else
      true
    end

  end

  # def get_human_spot
  #   spot = nil
  #   until spot
  #     spot = gets.chomp.to_i
  #     if @board[spot] != "X" && @board[spot] != "O"
  #       @board[spot] = @hum
  #     else
  #       spot = nil
  #     end
  #   end
  # end

  # def eval_board
  #   spot = nil
  #   until spot
  #     if @board[4] == "4"
  #       spot = 4
  #       @board[spot] = @com
  #     else
  #       spot = get_best_move(@board, @com)
  #       if @board[spot] != "X" && @board[spot] != "O"
  #         @board[spot] = @com
  #       else
  #         spot = nil
  #       end
  #     end
  #   end
  # end

  # def get_best_move(board, next_player, depth = 0, best_score = {})
  #   available_spaces = []
  #   best_move = nil
  #   board.each do |s|
  #     if s != "X" && s != "O"
  #       available_spaces << s
  #     end
  #   end
  #   available_spaces.each do |as|
  #     board[as.to_i] = @com
  #     if game_is_over(board)
  #       best_move = as.to_i
  #       board[as.to_i] = as
  #       return best_move
  #     else
  #       board[as.to_i] = @hum
  #       if game_is_over(board)
  #         best_move = as.to_i
  #         board[as.to_i] = as
  #         return best_move
  #       else
  #         board[as.to_i] = as
  #       end
  #     end
  #   end
  #   if best_move
  #     return best_move
  #   else
  #     n = rand(0..available_spaces.count)
  #     return available_spaces[n].to_i
  #   end
  # end

  # def game_is_over(b)

  #   [b[0], b[1], b[2]].uniq.length == 1 ||
  #   [b[3], b[4], b[5]].uniq.length == 1 ||
  #   [b[6], b[7], b[8]].uniq.length == 1 ||
  #   [b[0], b[3], b[6]].uniq.length == 1 ||
  #   [b[1], b[4], b[7]].uniq.length == 1 ||
  #   [b[2], b[5], b[8]].uniq.length == 1 ||
  #   [b[0], b[4], b[8]].uniq.length == 1 ||
  #   [b[2], b[4], b[6]].uniq.length == 1
  # end

  # def tie(b)
  #   b.all? { |s| s == "X" || s == "O" }
  # end

end

game = Game.new
game.play_game
