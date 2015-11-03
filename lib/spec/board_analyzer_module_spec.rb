require_relative 'spec_helper'

describe BoardAnalyzer do

  class TestClass
    include BoardAnalyzer
  end

  let(:test_object) { TestClass.new }

  describe "#three_in_a_row?" do
    it "should return true if there is a match in the top horizontal row" do
      board = Board.new(["X","X","X","O","O", nil, nil, nil, nil])
      expect(test_object.three_in_a_row?(board)).to eq(true)
    end

    it "should return true if there is a match in the middle horizontal row" do
      board = Board.new(["X","X",nil,"O","O","O",nil,"X",nil])
      expect(test_object.three_in_a_row?(board)).to eq(true)
    end

    it "should return true if there is a match in the bottom horizontal row" do
      board = Board.new(["O","O",nil, nil, nil, nil,"X","X","X"])
      expect(test_object.three_in_a_row?(board)).to eq(true)
    end

    it "should return true if there is a match in the left vertical column" do
      board = Board.new(["O",nil,"X","O",nil,nil,"O",nil,"X"])
      expect(test_object.three_in_a_row?(board)).to eq(true)
    end

    it "should return true if there is a match in the middle vertical column" do
      board = Board.new(["O","X",nil,nil,"X",nil,"O","X",nil])
      expect(test_object.three_in_a_row?(board)).to eq(true)
    end

    it "should return true if there is a match in the right vertical column" do
      board = Board.new(["X",nil,"O","X",nil,"O",nil,nil,"O"])
      expect(test_object.three_in_a_row?(board)).to eq(true)
    end

    it "should return true if there is a match in the left diagonal" do
      board = Board.new(["X",nil,"O",nil,"X",nil,nil,"O","X"])
      expect(test_object.three_in_a_row?(board)).to eq(true)
    end

    it "should return true if there is a match in the right diagonal" do
      board = Board.new(["X","X","O",nil,"O",nil,"O",nil,nil])
      expect(test_object.three_in_a_row?(board)).to eq(true)
    end

    it "should return false if there is an empty board" do
      board = Board.new([nil,nil,nil,nil,nil,nil,nil,nil,nil])
      expect(test_object.three_in_a_row?(board)).to eq(false)
    end

    it "should return false if there is no match in a full board" do
      board = Board.new(["X","O","X","O","X","X","O","X","O"])
      expect(test_object.three_in_a_row?(board)).to eq(false)
    end
  end

  describe "#three_in_row_marker" do
    it "should return the correct marker for a top row three in a row sequence" do
      board = Board.new(["X","X","X","O","O", nil, nil, nil, nil])
      expect(test_object.three_in_a_row_marker(board)).to eq("X")
    end

    it "should return the correct marker for a right diagonal three in a row sequence" do
      board = Board.new(["X","X","O",nil,"O",nil,"O",nil,nil])
      expect(test_object.three_in_a_row_marker(board)).to eq("O")
    end

    it "should return nil for no match in an empty board" do
      board = Board.new([nil,nil,nil,nil,nil,nil,nil,nil,nil])
      expect(test_object.three_in_a_row_marker(board)).to eq(nil)
    end

    it "should return nil for no match in a full board" do
      board = Board.new(["X","O","X","O","X","X","O","X","O"])
      expect(test_object.three_in_a_row_marker(board)).to eq(nil)
    end

  end

  describe "#squares_empty?" do
    it "should return true for an empty board" do
      board = Board.new([nil,nil,nil,nil,nil,nil,nil,nil,nil])
      expect(test_object.squares_empty?(board)).to eq(true)
    end

    it "should return false for board with one marker" do
      board = Board.new([nil,nil,nil,nil,"X",nil,nil,nil,nil])
      expect(test_object.squares_empty?(board)).to eq(false)
    end

    it "should return false for a full board" do
      board = Board.new(["X","O","X","O","X","O","X","O","X"])
      expect(test_object.squares_empty?(board)).to eq(false)
    end

  end

  describe "#squares_full?" do
    it "should return false for an empty board" do
      board = Board.new([nil,nil,nil,nil,nil,nil,nil,nil,nil])
      expect(test_object.squares_full?(board)).to eq(false)
    end

    it "should return false for board with one marker" do
      board = Board.new([nil,nil,"X",nil,nil,nil,nil,nil,nil])
      expect(test_object.squares_full?(board)).to eq(false)
    end

    it "should return false for board with one empty location" do
      board = Board.new(["O","X","X","X","O","O","X",nil,"O"])
      expect(test_object.squares_full?(board)).to eq(false)
    end

    it "should return true for a full board" do
      board = Board.new(["X","O","X","O","X","O","X","O","X"])
      expect(test_object.squares_full?(board)).to eq(true)
    end
  end


  describe "#count_marker" do
    it "should count the correct number of a given marker when there is more than 0" do
      board = Board.new(["X","O","X","O",nil,"O","X","O","X"])
      expect(test_object.count_marker(board,"O")).to eq(4)
    end

    it "should count the correct number of a given marker when there is 0" do
      board = Board.new([nil,nil,nil,"P",nil,nil,nil,nil,nil])
      expect(test_object.count_marker(board,"O")).to eq(0)
    end
  end

  describe "#most_eligible_square" do
    it "should return the numerical value of the first square that is in the most sequences with only 1 marker for the condition that at least one square exists in at least two of such sequences" do
      board = Board.new(["X", nil, nil, nil, "X", nil, nil, nil, "X"])
      expect(test_object.most_eligible_square(board)).to eq(2)
    end

    it "should return nil when there isn't any square that exists in at least two sequences such that the there is only one marker" do
      board = Board.new([nil, nil, nil, "X", nil, "X", nil, nil, nil])
      expect(test_object.most_eligible_square(board)).to eq(nil)
    end

  end

  describe "#sequence_filler_square" do
    it "should return the numerical value of the space that is the third square to complete a sequence" do
      board = Board.new(["X", nil, nil, "X", nil, nil, nil, nil, nil])
      expect(test_object.sequence_filler_square(board)).to eq(6)
    end

    it "should provide the numerical value of the space that is the third square to complete a sequence" do
      board = Board.new(["X", nil, nil, nil, nil, "X", nil, nil, nil])
      expect(test_object.sequence_filler_square(board)).to eq(nil)
    end

  end


end
