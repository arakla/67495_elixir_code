# A simple chain to see how many processes can be created.
# run on cli with 'elixir -r count.ex -e "Count.run(...)"'
# maxed out on Prof. H's machine with 262107
# can increase to million with the following:
# elixir --erl "+P 1000000" -r count.ex -e "Count.run(1000000)"

defmodule Count do
  def counter(next_pid) do    
    receive do
      n -> 
        send next_pid, n + 1
    end
  end

  def create_processes(n) do
    last = Enum.reduce 1..n, self, 
             fn (_,send_to) -> 
               spawn(Count, :counter, [send_to]) 
             end 

    send last, 0  

    receive do  
      final_count when is_integer(final_count) -> 
        "Count reached #{inspect(final_answer)}"
    end
  end

  def run(n) do
    IO.puts inspect :timer.tc(Count, :create_processes, [n])
  end
end
