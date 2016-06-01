# A simple way of passing messages between processes
# run on cli with 'elixir -r messages.ex -e "Talk.run(...)"'
# comment out recursion on lines 10,13 for processes to die after one iteration

defmodule Talk do
  def speak do
    receive do
      {sender, msg} when msg == "to_luke" ->
        send sender, { :ok, "Luke, I am your father." }
        speak
      {sender, msg} when msg == "to_vader" ->
        send sender, { :ok, "Nooo!"  }
        speak
    end
  end

  def create_processes do
    pid1 = spawn(Talk, :speak, [])
    pid2 = spawn(Talk, :speak, [])

    [pid1, pid2]
  end

  def send_msg({pid, msg}) do
    send pid, {self, msg}
  end

  def wait_for_response do 
    receive do 
      {:ok, msg} -> msg
      IO.puts "#{msg}"
      msg
    end
  end

  def check_status(pid) do
    IO.puts "Is process alive? #{Process.alive? pid}"
  end

  def run(count) do
    [pid1, pid2] = create_processes
    for i <- 1..count do
      IO.puts i
      check_status(pid1)
      Enum.map([{pid1, "to_luke"}, {pid2, "to_vader"}], fn(x) -> send_msg(x) end)   
      |> Enum.map(fn(x) -> {i, x, wait_for_response} end)
      check_status(pid1)
    end
    IO.puts "Final check"
    check_status(pid1)
  end
end