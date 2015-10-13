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
      expect(@model.board.squares).to eq(["0", "1", "2", "3", "4", "5", "6", "7", "8"])
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

  describe "#add_human_player" do
    it "should add a human player object to the players array" do
      @model.add_human_player
      expect(@model.players.index {|player| player.is_a?(HumanPlayer)}).to eq(0)
    end
  end

  describe "#add_computer_player" do
    it "should add a computer player object to the players array" do
      @model.add_computer_player
      expect(@model.players.index {|player| player.is_a?(ComputerPlayer)}).to eq(0)
    end
  end

  describe "#switch_player" do
    it "should change the current player to the other player in the players list" do
     @model.add_human_player
     @model.add_computer_player

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
      player = @model.add_human_player
      @model.current_player = player
      location =
      @model.store_move(location)
    end
  end

  describe "#final_board_state" do
    it "should return the board with numerical digits replaced by one space" do
      expect(@model.final_board_state).to eq([" "," "," "," "," "," "," "," "," "])
    end
  end

  describe "#board_content" do
    it "should return the board as is" do
      expect(@model.board_content).to eq(["0","1","2","3","4","5","6","7","8"])
    end
  end

  describe "#add_to_board" do
    it "should add the indicated marker to the board's squares" do
      expect(@model.board.squares).to eq(["0", "1", "2", "3", "4", "5", "6", "7", "8"])
      @model.add_to_board(8,"X")
      expect(@model.board.squares).to eq(["0", "1", "2", "3", "4", "5", "6", "7", "X"])
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
      @model.validate_move_location("2")
    end

    it "should return false for an invalid location" do
      @model.validate_move_location("20")
    end
  end

  describe "#get_player_by_marker" do
    it "should return the player for a given marker" do

      @model.add_human_player
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