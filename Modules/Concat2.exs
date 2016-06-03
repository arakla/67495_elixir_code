defmodule Concat2 do
  def join(a, b \\ nil, sep \\ " ")

  def join(a, b, _sep) when is_nil(b) do
    a
  end

  def join(a, b, sep) do
    a <> sep <> b
  end
end

IO.puts Concat2.join("Hello", "world")      #=> Hello world
IO.puts Concat2.join("Hello", "world", "_") #=> Hello_world
IO.puts Concat2.join("Hello")               #=> Hello
