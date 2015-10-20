require_relative 'spec_helper'

describe GameController do

  before :each do
    @controller = GameController.new
    allow_any_instance_of(ComputerPlayer).to receive(:sleep).and_return(nil)
  end

  describe "::new" do
    it "initializes a new GameView object instance variable" do
      expect(@controller.model).to be_a GameModel
    end

    it "initializes a new GameModel object instance variable" do
      expect(@controller.view).to be_a GameView
    end

    it "initializes a new UI object instance variable" do
      expect(@controller.ui).to be_a UI
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