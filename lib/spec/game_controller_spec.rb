require_relative 'spec_helper'

describe GameController do

  before :each do
    @controller = GameController.new
  end

  describe "::new" do
    it "initializes a new GameView object instance variable" do
      expect(@controller.model).to be_a GameModel
    end

    it "initializes a new GameModel object instance variable" do
      expect(@controller.view).to be_a GameView
    end

  end

  describe "#get_game_type" do
    it "returns the integer, 1, if 1 is chosen" do
      allow(STDIN).to receive(:gets) { "1" }
      expect(@controller.get_game_type).to eq(1)
    end

    it "returns the integer, 2, if 2 is chosen" do
      allow(STDIN).to receive(:gets) { "2" }
      expect(@controller.get_game_type).to eq(2)
    end

    it "returns the integer, 3, if 3 is chosen" do
      allow(STDIN).to receive(:gets) { "3" }
      expect(@controller.get_game_type).to eq(3)
    end

    it "outputs an invalid input message if an invalid input is received and returns nil" do
      allow(STDIN).to receive(:gets) { "A" }
      expect {  @controller.get_game_type }.to output("Sorry, that input is not valid, please try again.\n").to_stdout
      expect(@controller.get_game_type).to eq(nil)
    end
  end


end