require_relative 'spec_helper'

describe Board do

  before :each do
    @board = Board.new(["0", "1", "2", "3", "4", "5", "6", "7", "8"])
  end

  describe "#new" do
    it "returns a new board object with 0 input parameters" do
      expect(@board).to be_a Board
    end

    it "returns a new board object with 1 board input array" do
      expect(@board).to be_a Board
    end

    it "initializes an array variable for the input board input array" do
      @board = Board.new(["X","O","X","O","X","O","X","O","X"])
      expect(@board.state).to eq(["X","O","X","O","X","O","X","O","X"])
    end
  end

  describe "#state" do
    it "returns an array representating the state of the squares" do
      expect(@board.state).to eq(["0", "1", "2", "3", "4", "5", "6", "7", "8"])
    end
  end

  describe "#clear_state" do
    it "returns an array representating the state of the squares without the numbers" do
      board = Board.new(["X", "X", "X", "O", "O", "5", "6", "7", "8"])
      expect(board.clear_state).to eq(["X", "X", "X", "O", "O", " ", " ", " ", " "])
    end
  end

  describe "#place_marker" do
    it "should place a specified marker on a specified spot" do
      @board.place_marker(7, "X")
      expect(@board.state).to eq(["0", "1", "2", "3", "4", "5", "6", "X", "8"])
    end

    it "shouldn't place a marker for an invalid location" do
      @board.place_marker(10, "X")
      expect(@board.state).to eq(["0", "1", "2", "3", "4", "5", "6", "7", "8"])
    end

    it "shouldn't place a marker for an invalid marker" do
      @board.place_marker(10, "XO")
      expect(@board.state).to eq(["0", "1", "2", "3", "4", "5", "6", "7", "8"])
    end
  end

  describe "#three_in_a_row?" do
    it "should return true if there is a match in the top horizontal row" do
      board = Board.new(["X","X","X","O","O", "5", "6", "7", "8"])
      expect(board.three_in_a_row?).to eq(true)
    end

    it "should return true if there is a match in the middle horizontal row" do
      board = Board.new(["X","X","2","O","O","O","6","X","8"])
      expect(board.three_in_a_row?).to eq(true)
    end

    it "should return true if there is a match in the middle horizontal row" do
      board = Board.new(["O","O","2", "3", "4", "5","X","X","X"])
      expect(board.three_in_a_row?).to eq(true)
    end

    it "should return true if there is a match in the left vertical column" do
      board = Board.new(["O","1","X","O","4", "5","O","7","X"])
      expect(board.three_in_a_row?).to eq(true)
    end

    it "should return true if there is a match in the middle vertical column" do
      ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
      board = Board.new(["O","X","2", "3","X","5","O","X","8"])
      expect(board.three_in_a_row?).to eq(true)
    end

    it "should return true if there is a match in the right vertical column" do
      board = Board.new(["X","1","O","X","4","O","6","7","O"])
      expect(board.three_in_a_row?).to eq(true)
    end

    it "should return true if there is a match in the left diagonal" do
      board = Board.new(["X","1","O","3","X","O","6","O","X"])
      expect(board.three_in_a_row?).to eq(true)
    end

    it "should return true if there is a match in the right diagonal" do
      board = Board.new(["X","X","O","3","O","5","O","7","8"])
      expect(board.three_in_a_row?).to eq(true)
    end

    it "should return false if there is no match in an empty board" do
      board = Board.new([nil,nil,nil,nil,nil,nil,nil,nil,nil])
      expect(board.three_in_a_row?).to eq(false)
    end

    it "should return false if there is no match in a board with only string representations of digits" do
      board = Board.new(["0", "1", "2", "3", "4", "5", "6", "7", "8"])
      expect(board.three_in_a_row?).to eq(false)
    end

    it "should return false if there is no match in a full board" do
      board = Board.new(["X","O","X","O","X","X","O","X","O"])
      expect(board.three_in_a_row?).to eq(false)
    end
  end


  describe "#squares_full?" do
    it "should return true for a count of 0 'numerical' values" do
      board = Board.new(["X","O","X","O","X","O","X","O","X"])
      expect(board.squares_full?).to eq(true)
    end

    it "should return false for more than 0 'numerical' values" do
      board = Board.new(["X","O","X","O", "4","O","X","O","X"])
      expect(board.squares_full?).to eq(false)
    end

    it "should return false for all nil values" do
      board = Board.new([nil,nil,nil,nil,nil,nil,nil,nil,nil])
      expect(board.squares_full?).to eq(false)
    end
  end

  describe "#three_in_row_marker" do
    it "should return the correct marker for a top row three in a row sequence" do
      board = Board.new(["O","1","X","O","4","5","O","7","X"])
      expect(board.three_in_a_row_marker).to eq("O")
    end

    it "should return the correct marker for a right diagonal three in a row sequence" do
      board = Board.new(["X","X","O","3","O","5","O","7","8"])
      expect(board.three_in_a_row_marker).to eq("O")
    end

  end

  describe "#valid_marker?" do
    it "returns true for a string of length 1" do
      expect(@board.valid_marker?("O")).to eq(true)
    end

    it "returns false for a non string" do
      expect(@board.valid_marker?(0)).to eq(false)
    end

    it "returns false for a string of length other than 1" do
      expect(@board.valid_marker?("XX")).to eq(false)
    end
  end

  describe "#valid_location?" do
    it "returns true for an integer between 0 and 8 inclusive for unoccupied space" do
      expect(@board.valid_location?(3)).to eq(true)
    end

    it "returns false for a non integer" do
      expect(@board.valid_location?("3")).to eq(false)
    end

    it "return false for an integer outside of 0 through 8" do
      expect(@board.valid_location?(9)).to eq(false)
    end
  end

  describe "#location_inside_board?" do
    it "return true for an integer inside of 0 through 8" do
      expect(@board.valid_location?(5)).to eq(true)
    end

    it "return false for an integer outside of 0 through 8" do
      expect(@board.valid_location?(9)).to eq(false)
    end
  end

  describe "#unoccupied_square?" do
    it "returns true for a square that's unoccupied" do
      expect(@board.unoccupied_square?(3)).to eq(true)
    end

    it "returns false for a square that already has a marker" do
      @board.place_marker(3, "X")
      expect(@board.unoccupied_square?(3)).to eq(false)
    end
  end
end
