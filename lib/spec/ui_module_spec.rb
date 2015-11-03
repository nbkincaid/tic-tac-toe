require_relative 'spec_helper'

describe "UI" do

  class UITestClass
    include UI
  end

  let(:test_object) { UITestClass.new }

  it "should output a message to the terminal" do
    expect {  test_object.give("hello world") }.to output("hello world\n").to_stdout
  end

  it "should get input from the terminal" do
    allow(STDIN).to receive(:gets) { "Hello world!" }
    expect(test_object.receive).to eq("Hello world!")
  end
end