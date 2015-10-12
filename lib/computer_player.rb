require_relative 'player'

class ComputerPlayer < Player

  GO_FIRST_MOVES =  [4,1,3,5,7,0,2,6,8]
  GO_SECOND_MOVES = [4,0,8,2,6,1,3,5,7,]

  SIDE_MOVES = [1,3,5,7]
  CORNER_MOVES = [0,2,6,8]

  def initialize
    @went_first = nil
  end

  def check_for_first_move(board)
    if board.squares_empty?
      @went_first = true
    end
  end

  def choose_location(board)
    sleep(2)

    priority_choice = board.sequence_filler_square
    if priority_choice != nil
      return priority_choice
    end

    board_marker_count = board.count_marker(self.marker)

    if board_marker_count == 0
      [4,0].each do |location|
        if board.valid_location?(location)
          return location
        end
      end
    end

    if board_marker_count == 1
      if board.has_at?(self.marker,4)
        [1,3,5,7].each do |location|
          if board.valid_location?(location)
            return location
          end
        end
      else
        [0,8,2,6].each do |location|
          if board.valid_location?(location)
            return location
          end
        end
      end
    end

    tactical_choice = board.most_eligible_square
    if tactical_choice != nil
      return tactical_choice
    end


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