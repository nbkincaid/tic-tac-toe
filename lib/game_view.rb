class GameView

  def clear
    "\e[H\e[2J"
  end

  def welcome_msg
    "\nWelcome to awesome terminal tic-tac-toe!"
  end

  def select_game_type_msg
    "\nWhat type of game do you want to play?\n\t1: human vs. human\n\t2: human vs. computer\n\t3: computer vs. computer\n\nSelect 1, 2 or 3 to continue"
  end

  def select_player_marker_msg(player_number, player_type)
    "\nPlease choose an alphabetical character for player #{player_number}, #{player_type}."
  end

  def already_selected_msg
    "Sorry, that marker has already been chosen, please choose again."
  end

  def retry_input_msg
    "Sorry, that input is not valid, please try again."
  end

  def get_first_player_msg(player_marker_1, player_marker_2)
    "\nWhich player would you like to go first?\n\t #{player_marker_1} or #{player_marker_2}?"
  end

  def show_board(board)
    "\t #{board[0] || 0} | #{board[1] || 1} | #{board[2] || 2}\n\t-----------\n\t #{board[3] || 3} | #{board[4] || 4} | #{board[5] || 5}\n\t-----------\n\t #{board[6] || 6} | #{board[7] || 7} | #{board[8] || 8}"
  end

  def show_final_board(board)
    "\t #{board[0] || " "} | #{board[1] || " "} | #{board[2] || " "}\n\t-----------\n\t #{board[3] || " "} | #{board[4] || " "} | #{board[5] || " "}\n\t-----------\n\t #{board[6] || " "} | #{board[7] || " "} | #{board[8] || " "}"
  end

  def get_move_msg(marker)
     "\nPlayer #{marker}, please enter where you would like to move."
  end

  def move_msg(location, marker)
    "\nThe last move was placed in space #{location} by #{marker}"
  end

  def current_turn_msg(marker)
    "\nCurrent Turn: Player #{marker}\n\n"
  end

  def winner_msg(winner_marker)
     "\n\t#{winner_marker} wins!"
  end

  def cat_game_msg
    "\n\tCat game!"
  end

  def thank_you_msg
    "\nThank you for playing!\n\n"
  end


end