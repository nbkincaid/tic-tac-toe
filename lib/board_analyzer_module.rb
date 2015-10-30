module BOARDANALYZER

  SEQUENCES = [ [0,1,2],
                [3,4,5],
                [6,7,8],
                [0,3,6],
                [1,4,7],
                [2,5,8],
                [0,4,8],
                [2,4,6]
              ]

  # def clear_state
  #   squares.map do |square|
  #     if square =~ /[[:alpha:]]/
  #       square
  #     else
  #       " "
  #     end
  #   end
  # end

  def three_in_a_row?(board)
    ( [board.squares[0], board.squares[1], board.squares[2]].uniq.length == 1 ||
      [board.squares[3], board.squares[4], board.squares[5]].uniq.length == 1 ||
      [board.squares[6], board.squares[7], board.squares[8]].uniq.length == 1 ||
      [board.squares[0], board.squares[3], board.squares[6]].uniq.length == 1 ||
      [board.squares[1], board.squares[4], board.squares[7]].uniq.length == 1 ||
      [board.squares[2], board.squares[5], board.squares[8]].uniq.length == 1 ||
      [board.squares[0], board.squares[4], board.squares[8]].uniq.length == 1 ||
      [board.squares[2], board.squares[4], board.squares[6]].uniq.length == 1
    ) && board.squares.uniq != [nil]
  end

  # def three_in_a_row_marker
  #   SEQUENCES.each do |seq|
  #     sequence_vals = [ squares[seq[0]], squares[seq[1]], squares[seq[2]] ].uniq
  #     if sequence_vals.length == 1
  #       return sequence_vals[0]
  #     end
  #   end
  #   return nil
  # end


  # def squares_empty?
  #   squares.uniq.all? {|marker| !(marker =~ /[[:alpha:]]/)}
  # end

  # def squares_full?
  #   square_content_uniqs = squares.uniq
  #   square_content_uniqs.length == 2 && square_content_uniqs.all? {|marker| marker =~ /[[:alpha:]]/}
  # end

  # def count_marker(marker)
  #   squares.count(marker)
  # end

  # def most_eligible_square

  #   candidate_vals = []

  #   SEQUENCES.each do |seq|
  #     sequence_vals = [ squares[seq[0]], squares[seq[1]], squares[seq[2]] ].uniq

  #     if (sequence_vals.uniq.count) == 3 && (sequence_vals.count {|val| val =~ /\A\d+\Z/ }) == 2
  #       numerical_digits = sequence_vals.select {|val| val =~ /\A\d+\Z/ }
  #       numerical_digits.each {|val| candidate_vals << val}
  #     end
  #   end

  #   if (candidate_vals.length != 0)  && (candidate_vals.length != candidate_vals.uniq.length)
  #     most_eligible_square = candidate_vals.max_by{|val| candidate_vals.count(val) }
  #     most_eligible_square.to_i
  #   else
  #     nil
  #   end

  # end

  # def sequence_filler_square

  #   SEQUENCES.each do |seq|
  #     sequence_vals = [ squares[seq[0]], squares[seq[1]], squares[seq[2]] ].uniq

  #     if sequence_vals.length == 2 && sequence_vals.any? {|val| val =~ /\A\d+\Z/ }
  #       sequence_filler_square = sequence_vals.find {|val| val =~ /\A\d+\Z/ }
  #       return sequence_filler_square.to_i
  #     end
  #   end

  #   nil

  # end



end