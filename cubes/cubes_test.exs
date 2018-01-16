ExUnit.start()

defmodule CubesTest do
  Code.require_file("./cubes.ex")
  use ExUnit.Case

  def testFindNb(numtest, m, ans) do
    IO.puts("Test #{numtest}")
    assert Cubes.find_nb(m) == ans
  end

  test "find_nb" do
    testFindNb(1, 4_183_059_834_009, 2022)
    testFindNb(2, 24_723_578_342_962, -1)
    testFindNb(3, 135_440_716_410_000, 4824)
    testFindNb(4, 40_539_911_473_216, 3568)
    testFindNb(5, 131_443_152_397_956, 4788)
    testFindNb(6, 3_409_417_908_428_841, 10806)
    testFindNb(7, 2_377_805_787_562_500, 9875)
    testFindNb(8, 908_644_458_312_900, 7764)
  end
end
