class Board

  attr_reader :squares

  def initialize(squares = nil)
    @squares = squares || Array.new(9)
  end

  def place_marker(location, marker)
    if valid_location?(location) && valid_marker?(marker)
      squares[location] = marker
      true
    else
      false
    end
  end

  def valid_marker?(marker)
    marker.is_a?(String) && marker.match(/^[[:alpha:]]+$/) != nil && marker.length == 1
  end

  def valid_location?(location)
    (location.is_a? Integer) && location_inside_board?(location) && unoccupied_square?(location)
  end

  def has_at?(marker,location)
    squares[location] == marker
  end

  def location_inside_board?(location)
    location >= 0 && location <= 8
  end

  def unoccupied_square?(location)
    squares[location] == nil
  end

  private

  attr_writer :squares

end