defmodule ElixirScratchpadTest do
  use ExUnit.Case
  doctest ElixirScratchpad

  test "greets the world" do
    assert ElixirScratchpad.hello() == :world
  end
end
