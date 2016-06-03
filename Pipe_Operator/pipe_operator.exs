defmodule Piping do

  def foo do
    first(second(third(last)))
    last
    |> third
    |> second
    |> first
  end

  def example1 do
    String.ends_with?("elixir", "xir")
  end

  def pipe1 do
    "elixir" |> String.ends_with?("xir")
  end

  def example2 do
    String.upcase("Elixir rocks")
  end

  def pipe2 do
    "Elixir rocks" |> String.upcase
  end

  def example3 do
    Enum.map(String.split("Elixir rocks"), &String.upcase/1)
  end

  def pipe3 do
    "Elixir rocks"
    |> String.split
    |> Enum.map( &String.upcase/1 )
  end

  # type the rest manually into interactive elixir
  def example4 do
    Integer.digits(String.to_integer(String.slice(String.reverse("612016"), 0..3)))
  end

  def pipe4 do
    String.reverse("612016")
    |> String.slice(0..3)
    |> String.to_integer
    |> Integer.digits
  end

  # take a list of integers and find the 2nd greatest value
  def easy_problem do
    [5, 2, 16, 18]
    |> Enum.sort
    |> Enum.at(-2)
  end



  # is n a perfect square
  def problem2(n) do
    n
    |> :math.sqrt()
    |> :math.pow(2) == n
  end


end