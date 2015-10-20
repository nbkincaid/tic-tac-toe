require_relative 'spec_helper'

describe GameController do

  before :each do
    @controller = GameController.new
    allow_any_instance_of(ComputerPlayer).to receive(:sleep).and_return(nil)
  end

  describe "::new" do
    it "initializes a new GameController object" do
      expect(@controller).to be_a GameController
    end
  end

  describe "#play_game" do
    it "completes a human vs human game with no destructive input and specifies which player wins" do
      allow(STDIN).to receive(:gets).and_return("1","A","Z","A","0","1","3","4","6")
      expect {  @controller.play_game }.to output(/A wins!/).to_stdout
    end

    it "completes a human vs computer game with no destructive input and results in cat game" do
      allow(STDIN).to receive(:gets).and_return("2","A","Z","A", "4", "1", "3", "2", "8")
      expect {  @controller.play_game }.to output(/Cat game!/).to_stdout
    end

    it "completes a computer vs computer game with no destructive input and results in a cat game" do
      allow(STDIN).to receive(:gets).and_return("3","A","Z","Z")
      expect {  @controller.play_game }.to output(/Cat game!/).to_stdout
    end

    it "completes a human game with destructive input at each level and returns who wins" do
      allow(STDIN).to receive(:gets).and_return("one","1","5","A","A","Z","G","Z","0","car","1","3","3","4","G","6")
      expect {  @controller.play_game }.to output(/Z wins!/).to_stdout
    end

  end

end