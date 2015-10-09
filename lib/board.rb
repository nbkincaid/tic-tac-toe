class Board

  def initialize
    @squares = Array.new(9)
  end

  def show
    @squares
  end

  def place_marker(location, marker)
    if valid_location?(location) && valid_marker?(marker)
      @squares[location] = marker
    end
  end

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