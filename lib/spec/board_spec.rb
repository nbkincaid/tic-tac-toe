require_relative 'spec_helper'

describe Board do

  before :each do
    @board = Board.new
  end

  describe "#new" do
    it "returns a new board object" do
      expect(@board).to be_a Board
    end
  end

  describe "#show" do
    it "returns an array representating the state of the squares" do
      expect(@board.show).to eq([nil,nil,nil,nil,nil,nil,nil,nil,nil])
    end
  end

  describe "#place_marker" do
    it "should place a specified marker on a specified spot" do
      @board.place_marker(7, "X")
      expect(@board.show).to eq([nil,nil,nil,nil,nil,nil,nil,"X",nil])
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
