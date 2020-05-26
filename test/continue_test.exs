defmodule ContinueTest do
  use ExUnit.Case
  doctest Continue

  test "greets the world" do
    assert Continue.hello() == :world
  end
end
