defmodule TriggerTest do
  use ExUnit.Case
  doctest Trigger

  test "greets the world" do
    assert Trigger.hello() == :world
  end
end
