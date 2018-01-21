ExUnit.start()

defmodule KprimeTest do
  Code.require_file("./kprime.ex")
  use ExUnit.Case

  defp dotest1(numtest, k, start, nd, sol) do 
    IO.puts("Test #{numtest}")
    assert Kprime.count_Kprimes(k, start, nd) == sol
  end

  defp dotest2(numtest, s, sol) do 
    IO.puts("Test #{numtest}")
    assert Kprime.puzzle(s) == sol
  end
  
  test "count_Kprimes" do
    sol = [4,6,9,10,14,15,21,22,25,26,33,34,35,38,39,46,49,51,55,57,58,62,65,69,74,77,82,85,86,87,91,93,94,95]
    dotest1(1, 2, 0, 100, sol)

    sol =  [8, 12, 18, 20, 27, 28, 30, 42, 44, 45, 50, 52, 63, 66, 68, 70, 75, 76, 78, 92, 98, 99]
    dotest1(2, 3, 0, 100, sol)

    sol = [1020, 1026, 1032, 1044, 1050, 1053, 1064, 1072, 1092, 1100]
    dotest1(3, 5, 1000, 1100, sol)
  end

  # test "puzzle" do 
  #   dotest2(1, 138, 1)
  #   dotest2(2, 143, 2)
  # end
end
