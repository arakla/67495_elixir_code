# an example from elixir's processes section of their 'getting started' guide

# After reading through the code, this commented section will walk through storing keys and values using processes

# Run using iex key_value.exs in your terminal
# Then call start_link
# iex> {:ok, pid} = KV.start_link

# Begin by sending pid a :get message
# iex> send pid, {:get, :hello, self()}
# {:get, :hello, #PID<0.41.0>}

# When we flush, we get nil because the map has no keys
# iex> flush
# nil

# Let's add a key :hello by sending a :put message
# iex> send pid, {:put, :hello, :world}
# {:put, :hello, :world}

# Now, when we send a :get message with key :hello and flush, we get the :world value
# iex> send pid, {:get, :hello, self()}
# {:get, :hello, #PID<0.41.0>}
# iex> flush
# :world

# Processes are used to maintain state, and any process that knows the pid can manipulate that state

# It seems that Elixir also provides Agents which are wrappers around state
# iex> {:ok, pid} = Agent.start_link(fn -> %{} end)
# {:ok, #PID<0.72.0>}
# iex> Agent.update(pid, fn map -> Map.put(map, :hello, :world) end)
# :ok
# iex> Agent.get(pid, fn map -> Map.get(map, :hello) end)
# :world

# The agents.exs file will provide more detail on that topic

defmodule KeyValue do
  def start_link do
    # starts a new process that runs the loop function (with an empty map)
    Task.start_link(fn -> loop(%{}) end)
  end

  # waits for messages and performs appropriate action
  defp loop(map) do
    receive do
      # sends a message back to the caller before invoking loop
      {:get, key, caller} ->
        send caller, Map.get(map, key)
        loop(map)
      # adds a new key and value to the map before invoking loop
      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end
end