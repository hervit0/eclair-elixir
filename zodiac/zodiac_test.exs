ExUnit.start()

defmodule ZodiacTest do
  Code.require_file("./zodiac.ex")
  use ExUnit.Case

  test "renders proper zodiac sign" do
    assert Zodiac.get(20, 6) == "Gemini"
    assert Zodiac.get(28, 12) == "Capricorn"
    assert Zodiac.get(17, 10) == "Libra"
    assert Zodiac.get(22, 12) == "Capricorn"
  end
end
