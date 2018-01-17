defmodule PropertyBasedTest do
  use ExUnit.Case
  use ExUnitProperties

  property "bin1 <> bin2 always starts with bin1" do
    check all bin1 <- binary(),
              bin2 <- binary() do
      assert String.starts_with?(bin1 <> bin2, bin1)
    end
  end

  # This one is slow
  property "length/1 is always >= 0" do
    check all list <- list_of(term()) do
      assert length(list) >= 0
    end
  end

  # This one is deliberately failing
  property "list does not contain multiples of 4" do
    check all list <- list_of(positive_integer()) do
      refute Enum.any?(list, &(rem(&1, 4) == 0))
    end
  end

  test "sum of positive integer is greater than both integers" do
    sums = 
      ExUnitProperties.gen all a <- integer(),
                               a > 0,
                               b <- integer(),
                               b > 0 do
        {a + b, a, b}
      end

    check all {sum, a, b} <- sums do
      assert sum > a
      assert sum > b            
    end
  end
end
