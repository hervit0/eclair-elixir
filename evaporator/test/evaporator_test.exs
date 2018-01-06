defmodule EvaporatorTest do
  use ExUnit.Case

  test "Evaporator" do
    assert Evaporator.evaporator(10, 10, 10) == 22
    assert Evaporator.evaporator(10, 10, 5) == 29
    assert Evaporator.evaporator(100, 5, 5) == 59
  end
end
