defmodule My.Enum do
  def head([]), do: nil
  def head([head | _]), do: head

  # First Class function
  def apply(elem, f) when is_function(f) do
    f.(elem)
  end
end
