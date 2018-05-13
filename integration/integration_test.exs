ExUnit.start()

defmodule MagnetTest do
  Code.require_file("./integration.ex")
  use ExUnit.Case

  test "doubles" do
    assert RecreationOne.list_squared(1, 250) == [{1, 1}, {42, 2500}, {246, 84100}]
    assert RecreationOne.list_squared(42, 250) == [{42, 2500}, {246, 84100}]
    assert RecreationOne.list_squared(250, 500) == [{287, 84100}]
    assert RecreationOne.list_squared(344, 5388) == [{728, 722500}, {1434, 2856100}, {1673, 2856100}, {1880, 4884100},   {4264, 24304900}]
  end
end
