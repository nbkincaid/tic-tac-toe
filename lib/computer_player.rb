require_relative 'player'

class ComputerPlayer < Player

  GO_FIRST_MOVES =  [4,1,3,5,7,0,2,6,8]
  GO_SECOND_MOVES = [0,8,2,6,4,1,3,5,7]

  def initialize
    @went_first = nil
  end

  def check_for_first_move(board)
    if board.squares_empty?
      @went_first = true
    end
  end

  def choose_location(board)
    check_for_first_move(board)

    priority_choice = board.sequence_filler_square

    if priority_choice != nil
      return priority_choice
    else

      if @went_first
        move_choices = GO_FIRST_MOVES
      else
        move_choices = GO_SECOND_MOVES
      end

      move_choices.each do |location|
        if board.valid_location?(location)
          return location
        end
      end

    end

  end

end