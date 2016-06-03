defmodule RegExp do
  def basic(basic) do
    Regex.match?(~r/eat/,basic)
  end
  def basic2(basic) do
    Regex.match?(~r/^eat/, basic)
  end
  def basic3(basic) do
    Regex.match?(~r{^eat$}, basic)
  end
  def is_email(email) do
    Regex.match?(~r/^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}$/, email)
  end
  def is_email2(email) do
    Regex.match?(~r/^[\w]([^@\s,;]+)@(([\w-]+\.)+[a-z]{2,})$/, email)
  end
  def is_roman(check) do
    Regex.match?(~r/^(?=.)M*(D?C{0,3}|C[DM])(L?X{0,3}|X[LC])(V?I{0,3}|I[VX])$/, check)
  end
  def match(pattern,check) do
    Regex.match?(pattern, check)
  end
end
