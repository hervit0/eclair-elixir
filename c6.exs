defmodule T do
  def is(result, expectation) do
    IO.inspect result
    IO.inspect result == expectation
  end
end

# Named functions
defmodule Times do
  def double(x) do
    x * 2
  end

  def triple(n) do
    n * 3
  end

  def quadrule(x) do
    double(x) * 2
  end
end

T.is Times.double(2), 4
T.is Times.triple(2), 6
T.is Times.quadrule(2), 8

# Sum
defmodule Winston do
  def churchill(1), do: 1
  def churchill(n), do: churchill(n - 1) + n
end

T.is Winston.churchill(5), 15

# GCD
defmodule Gcd do
  def find(x, 0), do: x
  def find(x, y), do: find(y, rem(x, y))
end

T.is Gcd.find(5, 0), 5
T.is Gcd.find(5, 3), 1
T.is Gcd.find(15, 5), 5
