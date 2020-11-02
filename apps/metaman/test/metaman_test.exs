defmodule MetamanTest do
  use ExUnit.Case
  doctest Metaman

  test "greets the world" do
    assert Metaman.hello() == :world
  end
end
