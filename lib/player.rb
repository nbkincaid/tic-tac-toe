require_relative 'ui'
require_relative 'board_analyzer_module'

class Player
  include UI
  include BoardAnalyzer

  attr_reader :marker

  def initialize
    @marker = nil
  end

  def set_marker(marker)
    if valid_marker?(marker)
      @marker = marker
      true
    else
      false
    end
  end

  private

  def valid_marker?(marker)
    (marker.is_a? String) && (marker.length == 1) && marker =~ /[[:alpha:]]/
  end

end