class GameView

  def initialize

  end

  def welcome_msg
    puts "\nWelcome to awesome terminal tic-tac-toe!"
  end

  def select_game_type_msg
    puts "\nWhat type of game type do you want to play?"
    puts "\n\t1: human vs. human"
    puts "\t2: human vs. computer"
    puts "\t3: computer vs. computer"
    puts "\nSelect 1, 2 or 3 to continue"
  end

  def select_player_marker_msg(player_number, player_type)
    puts "\nPlease select an alphabetical character for player #{player_number}, #{player_type}."
  end

  def input_thank_you_msg
    puts "Thank you for the input."
  end

  def already_selected_msg
    puts "Sorry, that marker has already been chosen, please choose again."
  end

  def retry_input_msg
    puts "Sorry, that input is not recognized, please try again."
  end

  def get_first_player_msg(player_marker_1, player_marker_2)
    puts "Which player would you like to go first?"
    puts "\t #{player_marker_1} or #{player_marker_2}?"
  end

end