defmodule My.Enum do
  def head([]), do: nil
  def head([head | _]), do: head
end
