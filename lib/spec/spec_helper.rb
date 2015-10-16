require_relative '../board'
require_relative '../player'
require_relative '../human_player'
require_relative '../computer_player'
require_relative '../game_controller.rb'
require_relative '../game_view.rb'
require_relative '../game_model.rb'



# module Helpers
#   # Replace standard input with faked one StringIO.
#   def fake_stdin(input)
#     begin
#       $stdin = StringIO.new
#       $stdin.puts(input)
#       $stdin.rewind
#       yield
#     ensure
#       $stdin = STDIN
#     end
#   end
# end

# RSpec.configure do |conf|
#   conf.include(Helpers)
# end
