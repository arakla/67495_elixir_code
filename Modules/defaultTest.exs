defmodule DefaultTest do
  def dowork(x \\ IO.puts "hello") do
    x
  end
end
