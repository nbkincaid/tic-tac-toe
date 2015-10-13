require_relative 'spec_helper'

describe ComputerPlayer do

  before :each do
    @player = ComputerPlayer.new
  end

  describe "::new" do
    it "creates a new player object" do
      expect(@player).to be_a Player
    end

    it "creates a new computer player object" do
      expect(@player).to be_a ComputerPlayer
    end

    it "initializes a marker instance variable to nil" do
      expect(@player.marker).to eq(nil)
    end
  end

  describe "#choose_location" do
    it "selects the correct location according to its internal sequence of priorities" do
      @player.set_marker("N")
      board = Board.new([ "N","1","2",
                          "3","B","5",
                          "6","7","B"])
      expect(@player.choose_location(board)).to eq(2)
    end

    it "chooses defensive location to block potential winning moves by the opponent" do
      @player.set_marker("N")
      board = Board.new([ "N","1","B",
                          "3","B","5",
                          "6","7","8"])
      expect(@player.choose_location(board)).to eq(6)
    end

    it "chooses winning location" do
      @player.set_marker("N")
      board = Board.new([ "N","1","B",
                          "3","N","5",
                          "B","7","8"])
      expect(@player.choose_location(board)).to eq(8)
    end
  end

  describe "#appear_to_be_thinking" do
    it "waits two seconds" do
      start_time = Time.now
      @player.appear_to_be_thinking
      finish_time = Time.now
      delta = finish_time - start_time
      expect(delta >= 2).to be true
    end
  end

  describe "#avoid_defeat_or_win_game_choice" do
    it "should return the location that identifies that next winning move" do
      board = Board.new(["O","1","O","3","X","5","6","7","X"])
      expect(@player.avoid_defeat_or_win_game_choice(board)).to eq(1)
    end

    it "should return nil when there isn't two of the same marker and a space in any sequence" do
      board = Board.new(["O","1","2","3","X","5","6","O","X"])
      expect(@player.avoid_defeat_or_win_game_choice(board)).to eq(nil)
    end
  end

  describe "#tactical_choice" do
    it "should return the first location that exists in the most sequences with only one current alphabetical character" do
      board = Board.new([ "O","1","2",
                          "3","X","5",
                          "6","7","X"])
      expect(@player.tactical_choice(board)).to eq(2)
    end

    it "should return nil if the aren't any locations that exist in multiple sequences" do
       board = Board.new([  "O","1","2",
                            "X","4","X",
                            "6","7","O"])
      expect(@player.tactical_choice(board)).to eq(nil)
    end
  end

  describe "leftover_move_choice" do
    it "chooses from the supplied leftover move choices in order until there is a valid choice" do
      board = Board.new([ "O","1","2",
                          "X","O","X",
                          "6","7","O"])
      expect(@player.leftover_move_choice(board)).to eq(2)
    end
  end

  describe "#first_move?" do
    it "should return true if the player doesn't have any markers on the board" do
      @player.set_marker("N")
      board = Board.new([ "0","1","2",
                          "3","4","5",
                          "6","7","8"])
      expect(@player.first_move?(board)).to eq (true)
    end

    it "should return false if the player has one or more markers on the board" do
      @player.set_marker("N")
      board = Board.new([ "0","1","2",
                          "3","N","5",
                          "6","7","8"])
      expect(@player.first_move?(board)).to eq (false)
    end
  end

  describe "#second_move?" do
    it "should return true if the player has one marker on the board" do
      @player.set_marker("N")
      board = Board.new([ "0","1","2",
                          "3","N","5",
                          "6","7","8"])
      expect(@player.second_move?(board)).to eq (true)
    end

    it "should return false if the player does not have one marker on the board" do
      @player.set_marker("N")
      board = Board.new([ "N","1","B",
                          "3","N","5",
                          "6","7","8"])
      expect(@player.second_move?(board)).to eq (false)
    end
  end


  describe "#pick_first_move" do
    it "chooses the middle location, 4, if it's available" do
      @player.set_marker("N")
      board = Board.new([ "0","1","B",
                          "3","4","5",
                          "6","7","8"])
      expect(@player.pick_first_move(board)).to eq(4)
    end

    it "chooses the upper left location, 0, if 4 is not available" do
      @player.set_marker("N")
      board = Board.new([ "0","1","2",
                          "3","B","5",
                          "6","7","8"])
      expect(@player.pick_first_move(board)).to eq(0)
    end

    it "returns nil when neither 4 or 0 are available -> which shouldn't ever happen" do
      @player.set_marker("N")
      board = Board.new([ "B","1","2",
                          "3","B","5",
                          "6","7","8"])
      expect(@player.pick_first_move(board)).to eq(nil)
    end
  end


  describe "#pick_second_move" do
    it "chooses from the side choices, [1,3,5,7], when player has the center location, 4 " do
      @player.set_marker("N")
      board = Board.new([ "0","B","2",
                          "3","N","5",
                          "6","7","8"])
      expect(@player.pick_second_move(board)).to eq(3)
    end

    it "chooses from the corner choices, [0,2,6,8], when player does not have the center location, 4 " do
      @player.set_marker("N")
      board = Board.new([ "N","1","2",
                          "3","B","5",
                          "6","7","8"])
      expect(@player.pick_second_move(board)).to eq(8)
    end
  end

end
