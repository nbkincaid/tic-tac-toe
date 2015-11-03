require_relative 'spec_helper'

describe Player do

  before :each do
    @player = Player.new
  end

  describe "::new" do
    it "creates a new player object" do
      expect(@player).to be_a Player
    end

    it "initializes a marker instance variable to nil" do
      expect(@player.marker).to eq(nil)
    end
  end

  describe "#set_marker" do
    it "should set the player marker to input for an alphabetical string of length of length 1" do
      @player.set_marker("T")
      expect(@player.marker).to eq("T")
    end

    it "should return true when the marker gets set" do
      expect(@player.set_marker("A")).to eq(true)
    end

    it "should not set the player marker when the input is not an alphabetical string of length 1" do
      @player.set_marker("TT")
      expect(@player.marker).to eq(nil)
    end

    it "should return false when the marker does not get set" do
      expect(@player.set_marker("1")).to eq(false)
    end
  end

end