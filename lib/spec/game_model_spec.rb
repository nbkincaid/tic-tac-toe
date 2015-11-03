require_relative 'spec_helper'

describe GameModel do

  before :each do
    @model = GameModel.new
  end

  describe "::new" do
    it "initializes a board object instance variable" do
      expect(@model.board).to be_a Board
    end

    it "initializes a board object instance variable and sets the squares content to their indices in string format " do
      expect(@model.board.squares).to eq([nil, nil, nil, nil, nil, nil, nil, nil, nil])
    end

    it "initializes an empty instance variable called current_player" do
      expect(@model.current_player).to eq(nil)
    end

    it "initializes an empty array instance variable called players" do
      expect(@model.players).to eq([])
    end

    it "initializes an empty array instance variable called moves" do
      expect(@model.players).to eq([])
    end
  end

  describe "#set_players" do
    it "should set the players array to two human players for a game type of 1" do
      @model.set_players(1)
      expect(@model.players[0]).to be_a HumanPlayer
      expect(@model.players[1]).to be_a HumanPlayer
    end

    it "should set the players array to one human player and one computer player for a game type of 2" do
      @model.set_players(2)
      expect(@model.players[0]).to be_a HumanPlayer
      expect(@model.players[1]).to be_a ComputerPlayer
    end

    it "should set the players array to two computer players for a game type of 3" do
      @model.set_players(3)
      expect(@model.players[0]).to be_a ComputerPlayer
      expect(@model.players[1]).to be_a ComputerPlayer
    end
  end

  describe "#switch_player" do
    it "should change the current player to the other player in the players list" do
     @model.set_players(2)

     player1 = @model.players[0]
     player2 = @model.players[1]

     @model.current_player = player1

     expect(@model.current_player == player1).to eq(true)
     @model.switch_player
     expect(@model.current_player == player2).to eq(true)
    end
  end

  describe "#store_move" do
    it "should add a move as a hash to the moves array" do
      @model.set_players(2)
      @model.current_player = @model.players[0]
      location = 1
      @model.store_move(location)
      expect(@model.moves[-1]).to eq({player: @model.current_player, location: location})
    end
  end

  describe "#board_content" do
    it "should return the board as is" do
      expect(@model.board_content).to eq([nil,nil,nil,nil,nil,nil,nil,nil,nil])
    end
  end

  describe "#add_to_board" do
    it "should add the indicated marker to the board's squares" do
      expect(@model.board.squares).to eq([nil, nil, nil, nil, nil, nil, nil, nil, nil])
      @model.add_to_board(8,"X")
      expect(@model.board.squares).to eq([nil, nil, nil, nil, nil, nil, nil, nil, "X"])
    end
  end

  describe "#winner_exists?" do
    it "should return a boolean that represents if a player has won" do
      @model.add_to_board(0,"X")
      @model.add_to_board(3,"O")
      @model.add_to_board(4,"X")
      @model.add_to_board(5,"O")
      @model.add_to_board(8,"X")

      expect(@model.winner_exists?).to eq(true)
    end
  end

  describe "#winner_marker" do
    it "should return the winning marker" do
      @model.add_to_board(0,"X")
      @model.add_to_board(3,"O")
      @model.add_to_board(4,"X")
      @model.add_to_board(5,"O")
      @model.add_to_board(8,"X")

      expect(@model.winner_marker).to eq("X")
    end
  end

  describe "#validate_move_location" do
    it "should return true for a valid location" do
      @model.validate_move_location(nil)
    end

    it "should return false for an invalid location" do
      @model.validate_move_location("20")
    end
  end

  describe "#get_player_by_marker" do
    it "should return the player for a given marker" do
      @model.set_players(2)
      player = @model.players[0]
      player.set_marker("N")

      expect(@model.get_player_by_marker("N") == player).to eq(true)

    end

    it "should return nil when the player is not found" do
       expect(@model.get_player_by_marker("B") == nil).to eq(true)
    end
  end

  describe "#game_over?" do
    it "should return true when there is a winner" do
      @model.add_to_board(0,"X")
      @model.add_to_board(3,"O")
      @model.add_to_board(4,"X")
      @model.add_to_board(5,"O")
      @model.add_to_board(8,"X")

      expect(@model.game_over?).to eq(true)
    end

    it "should return false when the board is full but there is no winner" do
      @model.add_to_board(0,"X")
      @model.add_to_board(1,"O")
      @model.add_to_board(2,"X")
      @model.add_to_board(3,"O")
      @model.add_to_board(4,"X")
      @model.add_to_board(5,"X")
      @model.add_to_board(6,"O")
      @model.add_to_board(7,"X")
      @model.add_to_board(8,"O")

      expect(@model.game_over?).to eq(true)
    end
  end
end