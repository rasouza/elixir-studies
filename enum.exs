defmodule My.Enum do
  def head([]), do: nil
  def head([head | _]), do: head

  def apply(elem, f) do
    f.(elem)
  end
end
