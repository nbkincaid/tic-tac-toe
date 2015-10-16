require_relative 'spec_helper'

describe "UI" do
  before(:each) do
      @ui = UI.new
  end

  it "should output a message to the terminal" do
    expect {  @ui.give("hello world") }.to output("hello world\n").to_stdout
  end

  it "should get input from the terminal" do
    allow(STDIN).to receive(:gets) { "Hello world!" }
    expect(@ui.receive).to eq("Hello world!")
  end
end