require_relative 'spec_helper'

describe Board do

  before :each do
    @board = Board.new
    @board1 = Board.new(["X","O","X","O",nil,nil,nil,nil,nil])
  end

  describe "::new" do
    it "returns a new board object with 0 input parameters" do
      expect(@board).to be_a Board
    end

    it "returns a new board object with 1 board input array" do
      expect(@board1).to be_a Board
    end

    it "initializes an instance variable for the board input array" do
      expect(@board1.squares).to eq(["X","O","X","O",nil,nil,nil,nil,nil])
    end
  end

  describe "#squares" do
    it "returns the squares instance variable" do
      expect(@board1.squares).to eq(["X","O","X","O",nil,nil,nil,nil,nil])
    end
  end

  describe "#place_marker" do
    it "should place a specified marker on a specified spot" do
      @board.place_marker(7, "X")
      expect(@board.squares).to eq([nil,nil,nil,nil,nil,nil,nil,"X",nil])
    end

    it "shouldn't place a marker for an invalid location" do
      @board.place_marker(10, "X")
      expect(@board.squares).to eq([nil,nil,nil,nil,nil,nil,nil,nil,nil])
    end

    it "shouldn't place a marker for an invalid marker" do
      @board.place_marker(10, "XO")
      expect(@board.squares).to eq([nil,nil,nil,nil,nil,nil,nil,nil,nil])
    end

    it "should return true when a marker is placed" do
      expect(@board.place_marker(7, "X")).to eq(true)
    end

    it "should return false when a marker is not placed" do
      @board.place_marker(10, "XO")
      expect(@board.place_marker(10, "XO")).to eq(false)
    end

  end

  describe "#has_at?" do
    it "should return true when the specified square contains the specified character" do
      board = Board.new([nil,nil,nil,"P",nil,nil,nil,nil,nil])
      expect(board.has_at?("P", 3)).to eq(true)
    end

    it "should return false when the squares do not contain the input character" do
      board = Board.new([nil,nil,nil,"P",nil,nil,nil,nil,nil])
      expect(board.has_at?("P", 4)).to eq(false)
    end
  end

  describe "#valid_marker?" do
    it "returns true for an alphabetical string of length 1" do
      expect(@board.valid_marker?("O")).to eq(true)
    end

    it "returns false for a non string" do
      expect(@board.valid_marker?(0)).to eq(false)
    end

    it "returns false for a string of length other than 1" do
      expect(@board.valid_marker?("XX")).to eq(false)
    end

    it "returns false for an numeric string" do
      expect(@board.valid_marker?("6")).to eq(false)
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
    it "returns true for a square that does not have an alpha marker" do
      expect(@board.unoccupied_square?(3)).to eq(true)
    end

    it "returns false for a square that already has a marker" do
      @board.place_marker(3, "X")
      expect(@board.unoccupied_square?(3)).to eq(false)
    end
  end
end
