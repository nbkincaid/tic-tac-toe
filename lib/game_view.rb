class GameView

  def clear
    puts "\e[H\e[2J"
  end

  def welcome_msg
    puts "\nWelcome to awesome terminal tic-tac-toe!"
  end

  def select_game_type_msg
    puts "\nWhat type of game do you want to play?"
    puts "\n\t1: human vs. human"
    puts "\t2: human vs. computer"
    puts "\t3: computer vs. computer"
    puts "\nSelect 1, 2 or 3 to continue"
  end

  def select_player_marker_msg(player_number, player_type)
    puts "\nPlease choose an alphabetical character for player #{player_number}, #{player_type}."
  end

  def input_thank_you_msg
    puts "Thank you for the input."
  end

  def already_selected_msg
    puts "Sorry, that marker has already been chosen, please choose again."
  end

  def retry_input_msg
    puts "Sorry, that input is not valid, please try again."
  end

  def get_first_player_msg(player_marker_1, player_marker_2)
    puts "\nWhich player would you like to go first?"
    puts "\t #{player_marker_1} or #{player_marker_2}?"
  end

  def show_board(board)
    puts "\t #{board[0]} | #{board[1]} | #{board[2]}\n\t-----------\n\t #{board[3]} | #{board[4]} | #{board[5]}\n\t-----------\n\t #{board[6]} | #{board[7]} | #{board[8]}"
  end

  def get_move_msg(marker)
     puts "\nPlayer #{marker}, please enter where you would like to move."
  end

  def move_msg(location, marker)
    puts "\nThe last move was placed in space #{location} by #{marker}"
  end

  def winner_msg(winner_marker)
     puts "\n\t#{winner_marker}, wins!"
  end

  def cat_game_msg
    puts "\n\tCat game!"
  end

  def thank_you_msg
    puts "\nThank you for playing!\n\n"
  end


end