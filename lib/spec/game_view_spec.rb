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

end