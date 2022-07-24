defmodule RestExTest do
  use ExUnit.Case
  doctest RestEx

  test "greets the world" do
    assert RestEx.hello() == :world
  end
end
