class HumanPlayer

  attr_reader :marker

  def initialize
    @marker
  end

  def set_marker(marker)
    if valid_marker?(marker)
      @marker = marker
      true
    else
      false
    end
  end

  def valid_marker?(marker)
    if (marker.is_a? String) && (marker.length == 1) && marker =~ /[[:alpha:]]/
      true
    else
      false
    end
  end


end