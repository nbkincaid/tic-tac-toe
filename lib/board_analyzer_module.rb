module BoardAnalyzer

  SEQUENCES = [ [0,1,2],
                [3,4,5],
                [6,7,8],
                [0,3,6],
                [1,4,7],
                [2,5,8],
                [0,4,8],
                [2,4,6]
              ]

  def three_in_a_row?(board)
    SEQUENCES.each do |seq|
      sequence_vals = [board.squares[seq[0]], board.squares[seq[1]], board.squares[seq[2]] ].uniq
      return true if sequence_vals.any? && sequence_vals.length == 1
    end
    false
  end

  def three_in_a_row_marker(board)
    SEQUENCES.each do |seq|
      sequence_vals = [board.squares[seq[0]], board.squares[seq[1]], board.squares[seq[2]] ].uniq
      return sequence_vals.first if sequence_vals.length == 1
    end
    nil
  end

  def squares_empty?(board)
    board.squares.uniq.none?
  end

  def squares_full?(board)
    board.squares.all? && board.squares.length == 9
  end

  def count_marker(board,marker)
    board.squares.count(marker)
  end

  def most_eligible_square(board)

    candidate_vals = []

    SEQUENCES.each do |seq|

      square1 = board.squares[seq[0]] || seq[0]
      square2 = board.squares[seq[1]] || seq[1]
      square3 = board.squares[seq[2]] || seq[2]

      sequence_vals = [ square1, square2, square3 ].uniq

      if (sequence_vals.uniq.count) == 3 && (sequence_vals.count {|val| val.is_a? Integer}) == 2
        numerical_digits = sequence_vals.select {|val| val.is_a? Integer }
        numerical_digits.each {|val| candidate_vals << val}
      end
    end

    if (candidate_vals.length != 0)  && (candidate_vals.length != candidate_vals.uniq.length)
      most_eligible_square = candidate_vals.max_by{|val| candidate_vals.count(val) }
      most_eligible_square.to_i
    else
      nil
    end

  end

  def sequence_filler_square(board)

    SEQUENCES.each do |seq|
      square1 = board.squares[seq[0]] || seq[0]
      square2 = board.squares[seq[1]] || seq[1]
      square3 = board.squares[seq[2]] || seq[2]

      sequence_vals = [ square1, square2, square3 ].uniq

      if sequence_vals.length == 2 && sequence_vals.any? {|val| val.is_a? Integer}
        sequence_filler_square = sequence_vals.find {|val| val.is_a? Integer }
        return sequence_filler_square
      end

    end

    nil

  end

end