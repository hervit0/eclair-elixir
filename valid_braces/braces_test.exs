ExUnit.start()

defmodule RomanTest do
  Code.require_file("./braces.ex")
  use ExUnit.Case

  test "it validates properly" do
    assert Braces.valid_braces("()")
    assert Braces.valid_braces("(){}[]")
    assert Braces.valid_braces("(())")
    refute Braces.valid_braces("(){}[]]")
    refute Braces.valid_braces("[(])")
    refute Braces.valid_braces("[({})](]")
  end
end
