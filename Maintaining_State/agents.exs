# If you haven't already, I recommend you go through the key_value.exs example before this one

# Agent is a module in Elixir that provides an api wrappers for simple processes to maintain state.
# This code comes from an example found at the following link:
# https://blog.codeship.com/statefulness-in-elixir/ 
# This example implements stacks using agents to store its state


# Begin by calling start_link
# iex> tuple = Stack.start_link
# Store the pid for easy access
# iex> pid = elem(tuple, 1)
# Now push, pop, or determine size using the appropriate functions
defmodule Stack do
  def start_link do
    Agent.start_link fn -> [] end
  end

  def size(pid) do
    Agent.get pid, fn stack -> Enum.count(stack) end
  end

  def push(pid, item) do
    Agent.update pid, fn stack -> [item | stack] end
  end

  def pop(pid) do
    Agent.get_and_update pid, fn [item | last] ->
      {item, last}
    end
  end
end