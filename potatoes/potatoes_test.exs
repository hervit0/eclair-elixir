ExUnit.start()

defmodule PotatoesTest do
  Code.require_file("./potatoes.ex")
  use ExUnit.Case

  assert 50 == Potatoes.potatoes(99, 100, 98)
  assert 114 == Potatoes.potatoes(82, 127, 80)
end
