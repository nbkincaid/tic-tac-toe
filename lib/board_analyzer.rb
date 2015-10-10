class BoardAnalyzer

  attr_accessor :squares

  WINNING_SEQUENCES =  [ [0,1,2],
                        [3,4,5],
                        [6,7,8],
                        [0,3,6],
                        [1,4,7],
                        [2,5,8],
                        [0,4,8],
                        [2,4,6]
                      ]

  def initialize(squares = nil)
    @squares = squares
  end

  def squares_full?
    !self.squares.include?(nil)
  end



  # def game_over
    # this will check to see if
    # this will check to see if there are open spaces


  # def result


  # def game_is_over(b)

  #   [b[0], b[1], b[2]].uniq.length == 1 ||
  #   [b[3], b[4], b[5]].uniq.length == 1 ||
  #   [b[6], b[7], b[8]].uniq.length == 1 ||
  #   [b[0], b[3], b[6]].uniq.length == 1 ||
  #   [b[1], b[4], b[7]].uniq.length == 1 ||
  #   [b[2], b[5], b[8]].uniq.length == 1 ||
  #   [b[0], b[4], b[8]].uniq.length == 1 ||
  #   [b[2], b[4], b[6]].uniq.length == 1
  # end

  # def tie(b)
  #   b.all? { |s| s == "X" || s == "O" }
  # end



end