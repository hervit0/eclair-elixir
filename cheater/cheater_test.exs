ExUnit.start()

defmodule ZodiacTest do
  Code.require_file("./cheater.ex")
  use ExUnit.Case

  defp testing(_, n, ans) do
    assert Cheater.remov_nb(n) == ans
  end

  test "remov_nb" do
    # testing(1, 26, [{15, 21}, {21, 15}])
    # testing(2, 100, [])
    # testing(3, 101, [{55, 91}, {91, 55}])
    # testing(3, 1006, [{546, 925}, {925, 546}])
    # testing(3, 446, [{252, 393}, {393, 252}])
    # testing(3, 846, [{498, 717}, {717, 498}])
    testing(3, 1000003, [])
  end
end
