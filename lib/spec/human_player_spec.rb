require_relative 'spec_helper'

describe HumanPlayer do

  before :each do
    @player = HumanPlayer.new
  end

  describe "::new" do
    it "creates a new player object" do
      expect(@player).to be_a Player
    end

    it "initializes a marker instance variable to nil" do
      expect(@player.marker).to eq(nil)
    end
  end

end
