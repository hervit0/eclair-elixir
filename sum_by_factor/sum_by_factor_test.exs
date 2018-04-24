ExUnit.start()

defmodule RomanTest do
  Code.require_file("./sum_by_factor.ex")
  use ExUnit.Case

  test "it encodes properly" do
    # assert Roman.encode(1) == "I"
  end
end

# defmodule SumofdividedTest do

#   use ExUnit.Case

#   defp testing(numtest, lst, ans) do
#     IO.puts("Test #{numtest}")
#     assert Sumofdivided.sum_of_divided(lst) == ans
#   end
#   test "sum_of_divided" do
#     testing(1, [12, 15], [ {2, 12}, {3, 27}, {5, 15} ])
#     testing(2, [15,21,24,30,45], [ {2, 54}, {3, 135}, {5, 90}, {7, 21} ])
#   end

# end
