defmodule ElixirStudiesTest do
  use ExUnit.Case
  doctest ElixirStudies

  test "greets the world" do
    assert ElixirStudies.hello() == :world
  end
end
