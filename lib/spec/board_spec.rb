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

end
