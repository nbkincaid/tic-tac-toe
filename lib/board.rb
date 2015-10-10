class Board

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
    @squares
  end

  def place_marker(location, marker)
    if valid_location?(location) && valid_marker?(marker)
      @squares[location] = marker
    end
  end

  def three_in_a_row?
    ( [@squares[0], @squares[1], @squares[2]].uniq.length == 1 ||
      [@squares[3], @squares[4], @squares[5]].uniq.length == 1 ||
      [@squares[6], @squares[7], @squares[8]].uniq.length == 1 ||
      [@squares[0], @squares[3], @squares[6]].uniq.length == 1 ||
      [@squares[1], @squares[4], @squares[7]].uniq.length == 1 ||
      [@squares[2], @squares[5], @squares[8]].uniq.length == 1 ||
      [@squares[0], @squares[4], @squares[8]].uniq.length == 1 ||
      [@squares[2], @squares[4], @squares[6]].uniq.length == 1
    ) && @squares.uniq != [nil]
  end

  def three_in_a_row_marker

    SEQUENCES.each do |seq|
      sequence_vals = [ @squares[seq[0]], @squares[seq[1]], @squares[seq[2]] ].uniq

      if sequence_vals.length == 1
        return sequence_vals[0]
      end

    end

    return nil

  end

  def squares_full?
    !@squares.include?(nil)
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
    if @squares[location] == nil
      true
    else
      false
    end
  end

end