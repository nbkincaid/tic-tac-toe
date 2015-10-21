require_relative 'player'

class ComputerPlayer < Player

  def choose_location(board)
    appear_to_be_thinking

    first_priority = avoid_defeat_or_win_game_choice(board)
    if first_priority != nil
      return first_priority
    end

    if first_move?(board)
      return pick_first_move(board)
    end

    if second_move?(board)
      return pick_second_move(board)
    end

    tactical_choice = tactical_choice(board)
    if tactical_choice != nil
      return tactical_choice
    end

    return leftover_move_choice(board)
  end

  private

  FIRST_MOVE_CHOICES = [4,0]
  SIDE_CHOICES = [1,3,5,7]
  CORNER_CHOICES = [0,8,2,6]
  LEFTOVER_MOVE_CHOICES = [4,0,8,2,6,1,3,5,7]

  def appear_to_be_thinking
    sleep(2)
  end

  def avoid_defeat_or_win_game_choice(board)
    board.sequence_filler_square
  end

  def tactical_choice(board)
    board.most_eligible_square
  end

  def leftover_move_choice(board)
    LEFTOVER_MOVE_CHOICES.each do |location|
      if board.valid_location?(location)
        return location
      end
    end
  end

  def first_move?(board)
    board.count_marker(self.marker) == 0
  end

  def second_move?(board)
    board.count_marker(self.marker) == 1
  end

  def pick_first_move(board)
    FIRST_MOVE_CHOICES.each do |location|
      if board.valid_location?(location)
        return location
      end
    end
    nil
  end

  def pick_second_move(board)
    if board.has_at?(self.marker,4)
      SIDE_CHOICES.select {|location| board.valid_location?(location)}[0]
    else
      CORNER_CHOICES.select {|location| board.valid_location?(location)}[0]
    end
  end

end