class Board

  attr_reader :squares

  def initialize(squares = nil)
    @squares = squares || Array.new(9)
  end

  # def clear_state
  #   squares.map do |square|
  #     if square =~ /[[:alpha:]]/
  #       square
  #     else
  #       " "
  #     end
  #   end
  # end

  def place_marker(location, marker)
    if valid_location?(location) && valid_marker?(marker)
      squares[location] = marker
      true
    else
      false
    end
  end

  # def three_in_a_row?
  #   ( [squares[0], squares[1], squares[2]].uniq.length == 1 ||
  #     [squares[3], squares[4], squares[5]].uniq.length == 1 ||
  #     [squares[6], squares[7], squares[8]].uniq.length == 1 ||
  #     [squares[0], squares[3], squares[6]].uniq.length == 1 ||
  #     [squares[1], squares[4], squares[7]].uniq.length == 1 ||
  #     [squares[2], squares[5], squares[8]].uniq.length == 1 ||
  #     [squares[0], squares[4], squares[8]].uniq.length == 1 ||
  #     [squares[2], squares[4], squares[6]].uniq.length == 1
  #   ) && squares.uniq != [nil]
  # end

  # def three_in_a_row_marker
  #   SEQUENCES.each do |seq|
  #     sequence_vals = [ squares[seq[0]], squares[seq[1]], squares[seq[2]] ].uniq
  #     if sequence_vals.length == 1
  #       return sequence_vals[0]
  #     end
  #   end
  #   return nil
  # end

  def valid_marker?(marker)
    # alpha_location = (marker =~ /[[:alpha:]]/)
    marker.is_a?(String) && marker.match(/^[[:alpha:]]+$/) != nil && marker.length == 1
  end

  def valid_location?(location)
    (location.is_a? Integer) && location_inside_board?(location) && unoccupied_square?(location)
  end

  # def squares_empty?
  #   squares.uniq.all? {|marker| !(marker =~ /[[:alpha:]]/)}
  # end

  # def squares_full?
  #   square_content_uniqs = squares.uniq
  #   square_content_uniqs.length == 2 && square_content_uniqs.all? {|marker| marker =~ /[[:alpha:]]/}
  # end

  def has_at?(marker,location)
    squares[location] == marker
  end

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

  def location_inside_board?(location)
    location >= 0 && location <= 8
  end

  def unoccupied_square?(location)
    squares[location] == nil
  end

  private

  attr_writer :squares

  # SEQUENCES = [ [0,1,2],
  #               [3,4,5],
  #               [6,7,8],
  #               [0,3,6],
  #               [1,4,7],
  #               [2,5,8],
  #               [0,4,8],
  #               [2,4,6]
  #             ]


end