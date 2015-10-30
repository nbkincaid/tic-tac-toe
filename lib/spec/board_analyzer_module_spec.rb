require_relative 'spec_helper'



describe BOARDANALYZER do

  class TestClass
    include BOARDANALYZER
  end

  let(:test_object) { TestClass.new } #{ include BOARDANALYZER } }

  describe "#three_in_a_row" do
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

    it "should return false if there is no match in an empty board" do
      board = Board.new([nil,nil,nil,nil,nil,nil,nil,nil,nil])
      expect(test_object.three_in_a_row?(board)).to eq(true)
    end

    it "should return false if there is no match in a full board" do
      board = Board.new(["X","O","X","O","X","X","O","X","O"])
      expect(test_object.three_in_a_row?(board)).to eq(false)
    end
  end




end


# describe "#clear_state" do
  #   it "returns an array representating the squares of the squares without the numbers" do
  #     board = Board.new(["X", "X", "X", "O", "O", "5", "6", "7", "8"])
  #     expect(board.clear_state).to eq(["X", "X", "X", "O", "O", " ", " ", " ", " "])
  #   end
  # end

  # describe "#three_in_a_row?" do
  #   it "should return true if there is a match in the top horizontal row" do
  #     board = Board.new(["X","X","X","O","O", "5", "6", "7", "8"])
  #     expect(board.three_in_a_row?).to eq(true)
  #   end

  #   it "should return true if there is a match in the middle horizontal row" do
  #     board = Board.new(["X","X","2","O","O","O","6","X","8"])
  #     expect(board.three_in_a_row?).to eq(true)
  #   end

  #   it "should return true if there is a match in the middle horizontal row" do
  #     board = Board.new(["O","O","2", "3", "4", "5","X","X","X"])
  #     expect(board.three_in_a_row?).to eq(true)
  #   end

  #   it "should return true if there is a match in the left vertical column" do
  #     board = Board.new(["O","1","X","O","4", "5","O","7","X"])
  #     expect(board.three_in_a_row?).to eq(true)
  #   end

  #   it "should return true if there is a match in the middle vertical column" do
  #     ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  #     board = Board.new(["O","X","2", "3","X","5","O","X","8"])
  #     expect(board.three_in_a_row?).to eq(true)
  #   end

  #   it "should return true if there is a match in the right vertical column" do
  #     board = Board.new(["X","1","O","X","4","O","6","7","O"])
  #     expect(board.three_in_a_row?).to eq(true)
  #   end

  #   it "should return true if there is a match in the left diagonal" do
  #     board = Board.new(["X","1","O","3","X","O","6","O","X"])
  #     expect(board.three_in_a_row?).to eq(true)
  #   end

  #   it "should return true if there is a match in the right diagonal" do
  #     board = Board.new(["X","X","O","3","O","5","O","7","8"])
  #     expect(board.three_in_a_row?).to eq(true)
  #   end

  #   it "should return false if there is no match in an empty board" do
  #     board = Board.new([nil,nil,nil,nil,nil,nil,nil,nil,nil])
  #     expect(board.three_in_a_row?).to eq(false)
  #   end

  #   it "should return false if there is no match in a board with only string representations of digits" do
  #     board = Board.new(["0", "1", "2", "3", "4", "5", "6", "7", "8"])
  #     expect(board.three_in_a_row?).to eq(false)
  #   end

  #   it "should return false if there is no match in a full board" do
  #     board = Board.new(["X","O","X","O","X","X","O","X","O"])
  #     expect(board.three_in_a_row?).to eq(false)
  #   end
  # end

  # describe "#three_in_row_marker" do
  #   it "should return the correct marker for a top row three in a row sequence" do
  #     board = Board.new(["O","1","X","O","4","5","O","7","X"])
  #     expect(board.three_in_a_row_marker).to eq("O")
  #   end

  #   it "should return the correct marker for a right diagonal three in a row sequence" do
  #     board = Board.new(["X","X","O","3","O","5","O","7","8"])
  #     expect(board.three_in_a_row_marker).to eq("O")
  #   end

  #   it "should return nil for no match in an empty board" do
  #     board = Board.new(["X","X","O","O","4","5","O","7","8"])
  #     expect(board.three_in_a_row_marker).to eq(nil)
  #   end

  #   it "should return nil for no match in a full board" do
  #     board = Board.new([nil,nil,nil,nil,nil,nil,nil,nil,nil])
  #     expect(board.three_in_a_row_marker).to eq(nil)
  #   end

  # end

  # describe "#squares_empty?" do
  #   it "should return true for a board with only numerical characters" do
  #     expect(@board.squares_empty?).to eq (true)
  #   end

  #   it "should return true for an empty board" do
  #     board = Board.new([nil,nil,nil,nil,nil,nil,nil,nil,nil])
  #     expect(board.squares_empty?).to eq(true)
  #   end

  #   it "should return false for board with one alphabetical character" do
  #     @board.place_marker(2, "X")
  #     expect(@board.squares_empty?).to eq (false)
  #   end

  #   it "should return false for a board with all alphabetical characters" do
  #     board = Board.new(["X","O","X","O","X","O","X","O","X"])
  #     expect(board.squares_empty?).to eq(false)
  #   end

  # end

  # describe "#squares_full?" do
  #   it "should return true for a count of 0 'numerical' values" do
  #     board = Board.new(["X","O","X","O","X","O","X","O","X"])
  #     expect(board.squares_full?).to eq(true)
  #   end

  #   it "should return false for more than 0 'numerical' values" do
  #     board = Board.new(["X","O","X","O", "4","O","X","O","X"])
  #     expect(board.squares_full?).to eq(false)
  #   end

  #   it "should return false for all numerical values" do
  #     expect(@board.squares_full?).to eq(false)
  #   end

  #   it "should return false for all nil values" do
  #     board = Board.new([nil,nil,nil,nil,nil,nil,nil,nil,nil])
  #     expect(board.squares_full?).to eq(false)
  #   end
  # end


  # describe "#count_marker" do
  #   it "should count the correct number of a given marker when there is more than 0" do
  #     board = Board.new(["X","O","X","O",nil,"O","X","O","X"])
  #     expect(board.count_marker("O")).to eq(4)
  #   end

  #   it "should count the correct number of a given marker when there is 0" do
  #     board = Board.new([nil,nil,nil,"P",nil,nil,nil,nil,nil])
  #     expect(board.count_marker("O")).to eq(0)
  #   end
  # end

  # describe "#most_eligible_square" do
  #   it "should return the numerical value of the first square that is in the most sequences with only 1 alpha character for the condition that at least one square exists in at least two of such sequences" do
  #     board = Board.new(["X", nil, nil, nil, "X", nil, nil, nil, "X"])
  #     expect(board.most_eligible_square).to eq(2)
  #   end

  #   it "should return nil when there isn't any square that exists in at least two sequences such that the there are only one alpha character" do
  #     board = Board.new([nil, nil, nil, "X", nil, "X", nil, nil, nil])
  #     expect(board.most_eligible_square).to eq(nil)
  #   end

  # end

  # describe "#sequence_filler_square" do
  #   it "should return the numerical value of the space that is the third square to complete a sequence" do
  #     board = Board.new(["X", "1", "2", "X", "4", "5", "6", "7", "8"])
  #     expect(board.sequence_filler_square).to eq(6)
  #   end

  #   it "should provide the numerical value of the space that is the third square to complete a sequence" do
  #     board = Board.new(["X", "1", "2", "3", "4", "X", "6", "7", "8"])
  #     expect(board.sequence_filler_square).to eq(nil)
  #   end

  # end
