# The credit for this code goes to: http://www.getlaura.com/how-to-test-ruby-io/

require 'stringio'

class UI
  def give(output_message, stdout = $stdout)
    stdout.puts output_message
  end

  def receive(stdin = $stdin)
    stdin.gets.chomp
  end
end

@ui = UI.new
@input = StringIO.new("test info\n")
@output = StringIO.new
@input_received = @ui.receive(@input)
@ui.give("test message", @output)

