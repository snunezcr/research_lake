defmodule RLUtilsTest do
  use ExUnit.Case
  doctest RLUtils

  test "greets the world" do
    assert RLUtils.hello() == :world
  end
end
