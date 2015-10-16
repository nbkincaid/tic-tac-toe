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
    it "returns the the game type if valid" do

    end
  end


end