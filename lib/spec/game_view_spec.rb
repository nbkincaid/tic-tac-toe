require_relative 'spec_helper'

describe GameView do

  before :each do
    @view = GameView.new
  end

  describe "::new" do
    it "initializes a new GameView object" do
      expect(@view).to be_a GameView
    end
  end

  describe "#clear" do
    it "returns the code to clear the screen" do
      expect(@view.clear).to eq("\e[H\e[2J")
    end
  end

  describe "#welcome_msg" do
    it "returns the correct message" do
      expect(@view.welcome_msg).to eq("\nWelcome to awesome terminal tic-tac-toe!")
    end
  end

end