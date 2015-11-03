module UI
  def give(output_message, stdout = $stdout)
    stdout.puts output_message
  end

  def receive(stdin = $stdin)
    stdin.gets.chomp
  end
end