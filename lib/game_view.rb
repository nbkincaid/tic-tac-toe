class GameView

  def initialize

  end

  def welcome_msg
    puts "\nWelcome to awesome terminal tic-tac-toe!"
  end

  def select_game_type_msg
    puts "\n\tWhat type of game type do you want to play?"
    puts "\t1: human vs. human"
    puts "\t2: human vs. computer"
    puts "\t3: computer vs. computer"
    puts "\nSelect 1, 2 or 3 to continue"
  end

  def retry_input_msg
    puts "Sorry, that input is not recognized, please try again."
  end


end