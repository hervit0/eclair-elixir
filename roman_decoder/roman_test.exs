ExUnit.start()

defmodule RomanTest do
  Code.require_file("./roman.ex")
  use ExUnit.Case

  test "it decodes properly" do
    assert Roman.decode("I") == 1
    assert Roman.decode("IV") == 4
    assert Roman.decode("XXI") == 21
    assert Roman.decode("MMVIII") == 2008
    assert Roman.decode("MDCLXVI") == 1666
  end
end
