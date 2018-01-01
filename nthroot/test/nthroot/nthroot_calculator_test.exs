defmodule NthrootCalculatorTest do
  use ExUnit.Case

  test "Negative number raises error" do
    assert_raise RuntimeError, "Nth root for a negative number, are you sure?", fn ->
      NthrootCalculator.root(-2, 2)
    end
  end

  test "Square root" do
    assert NthrootCalculator.root(2, 2) == 1.41421
    assert NthrootCalculator.root(4, 2) == 2.0
    assert NthrootCalculator.root(123_456_789, 2) == 11111.11106
  end

  test "3rd root" do
    assert NthrootCalculator.root(8, 3) == 2.0
    assert NthrootCalculator.root(123_456_789, 3) == 497.93386
  end

  test "Negative nth root" do
    assert NthrootCalculator.root(2, -2) == 0.70711
  end

  test "Huge numbers and root?" do
    # Hem it's breaking my Windows machine....
    # assert NthrootCalculator.root(123456789, 123456789) == 497.93386
  end
end
