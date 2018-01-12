ExUnit.start()

defmodule RomanTest do
  Code.require_file("./roman.ex")
  use ExUnit.Case

  test "it encodes properly" do
    assert Roman.encode(1) == "I"
    assert Roman.encode(4) == "IV"
    assert Roman.encode(21) =="XXI"
    assert Roman.encode(2008) == "MMVIII"
    assert Roman.encode(1666) == "MDCLXVI"
  end
end
