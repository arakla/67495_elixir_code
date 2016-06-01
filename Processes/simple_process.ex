# Example from video with small changes

pid = spawn fn ->
  receive do
    {sender, :ping} ->
      IO.puts "Got ping"
      send sender, :pong
  end

end

IO.puts "Is process alive? #{Process.alive? pid}"

send pid, {self, :ping}

IO.puts "Is process alive? #{Process.alive? pid}"

receive do
  message -> IO.puts "Got #{message} back"
end

IO.puts "Is process alive? #{Process.alive? pid}"

