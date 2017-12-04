defmodule Test do
  def assert(result, expectation) do
    IO.inspect result
    IO.inspect result == expectation
  end
end

# Swap function
swap = fn { a, b } -> { b, a } end
Test.assert swap.( {1, 2} ), {2, 1}

# List concat
list_concat = fn l1, l2 -> l1 ++ l2 end
Test.assert list_concat.([:a, :b], [:c, :d]), [:a, :b, :c, :d]

# Sum with arity of 3
sum_3 = fn a, b, c -> a + b + c end
Test.assert sum_3.(1, 2, 3), 6

# Tuple to array
tuplarray = fn { a, b } -> [a, b] end
Test.assert tuplarray.({4, 5}), [4, 5]

# Weak FizzBuzz
fizzBuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, x -> x
end

Test.assert fizzBuzz.(0,0,3), "FizzBuzz"
Test.assert fizzBuzz.(0,2,3), "Fizz"
Test.assert fizzBuzz.(1,0,3), "Buzz"
Test.assert fizzBuzz.(1,2,3), 3

# Less weak FizzBuzz
goodFizzBuzz = fn
  x -> fizzBuzz.(rem(x, 3), rem(x, 5), x)
end

Test.assert goodFizzBuzz.(15), "FizzBuzz"
Test.assert goodFizzBuzz.(9), "Fizz"
Test.assert goodFizzBuzz.(5), "Buzz"
Test.assert goodFizzBuzz.(8), 8

# Parametrized function
prefix = fn
  head -> fn tail -> Enum.join([head, tail], " ") end
end

mrs = prefix.("Mrs")
Test.assert mrs.("Woods"), "Mrs Woods"
Test.assert prefix.("Segnorita").("Monica"), "Segnorita Monica"

# Capture operator
plusTwo = fn(l) ->
  Enum.map(l, &(&1 + 2))
end

Test.assert Enum.map([1,2,3], &(&1 + 2)), [3,4,5]
Test.assert plusTwo.([1,2,3]), [3,4,5]
Test.assert Enum.each([1,2,3], &(IO.inspect(&1))), :ok
