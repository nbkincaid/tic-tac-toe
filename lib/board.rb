class Board

  attr_reader :squares

  SEQUENCES = [ [0,1,2],
                [3,4,5],
                [6,7,8],
                [0,3,6],
                [1,4,7],
                [2,5,8],
                [0,4,8],
                [2,4,6]
              ]

  def initialize(squares = nil)
    @squares = squares || Array.new(9)
  end

  def state
    self.squares
  end

  def clear_state
    self.squares.map do |square|
      if square =~ /[[:alpha:]]/
        square
      else
        " "
      end
    end
  end

  def place_marker(location, marker)
    if valid_location?(location) && valid_marker?(marker)
      self.squares[location] = marker
      true
    else
      false
    end
  end

  def three_in_a_row?
    ( [self.squares[0], self.squares[1], self.squares[2]].uniq.length == 1 ||
      [self.squares[3], self.squares[4], self.squares[5]].uniq.length == 1 ||
      [self.squares[6], self.squares[7], self.squares[8]].uniq.length == 1 ||
      [self.squares[0], self.squares[3], self.squares[6]].uniq.length == 1 ||
      [self.squares[1], self.squares[4], self.squares[7]].uniq.length == 1 ||
      [self.squares[2], self.squares[5], self.squares[8]].uniq.length == 1 ||
      [self.squares[0], self.squares[4], self.squares[8]].uniq.length == 1 ||
      [self.squares[2], self.squares[4], self.squares[6]].uniq.length == 1
    ) && self.squares.uniq != [nil]
  end

  def three_in_a_row_marker

    SEQUENCES.each do |seq|
      sequence_vals = [ self.squares[seq[0]], self.squares[seq[1]], self.squares[seq[2]] ].uniq

      if sequence_vals.length == 1
        return sequence_vals[0]
      end

    end

    return nil

  end

  def squares_empty?
    self.squares.uniq.all? {|marker| !(marker =~ /[[:alpha:]]/)}
  end

  def squares_full?
    square_content_uniqs = self.squares.uniq
    square_content_uniqs.length == 2 && square_content_uniqs.all? {|marker| marker =~ /[[:alpha:]]/}
  end

  def squares_contain?(marker)
    self.squares.include?(marker)
  end

  def has_at?(marker,location)
    self.squares[location] == marker
  end

  def count_marker(marker)
    self.squares.count(marker)
  end

  def most_eligible_square

    candidate_vals = []

    SEQUENCES.each do |seq|
      sequence_vals = [ self.squares[seq[0]], self.squares[seq[1]], self.squares[seq[2]] ].uniq

      if (sequence_vals.uniq.count) == 3 && (sequence_vals.count {|val| val =~ /\A\d+\Z/ }) == 2
        numerical_digits = sequence_vals.select {|val| val =~ /\A\d+\Z/ }
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

  def sequence_filler_square

    SEQUENCES.each do |seq|
      sequence_vals = [ self.squares[seq[0]], self.squares[seq[1]], self.squares[seq[2]] ].uniq

      if sequence_vals.length == 2 && sequence_vals.any? {|val| val =~ /\A\d+\Z/ }
        sequence_filler_square = sequence_vals.find {|val| val =~ /\A\d+\Z/ }
        return sequence_filler_square.to_i
      end
    end

    nil

  end

  # *********************************************************

  def valid_marker?(marker)
    if (marker.is_a? String) && (marker.length == 1)
      true
    else
      false
    end
  end

  def valid_location?(location)
    if (location.is_a? Integer) && location_inside_board?(location) && unoccupied_square?(location)
      true
    else
      false
    end
  end

  def location_inside_board?(location)
    if location >= 0 && location <= 8
      true
    else
      false
    end
  end

  def unoccupied_square?(location)
    if !(self.squares[location] =~ /[[:alpha:]]/)
      true
    else
      false
    end
  end

end