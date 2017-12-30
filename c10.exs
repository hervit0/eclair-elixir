defmodule T do
  def is(result, expectation) do
    IO.inspect "--------------------"
    IO.inspect "The result is:"
    IO.inspect result
    IO.inspect "The expectation is:"
    IO.inspect expectation

    if result != expectation do
      raise "YOU SHALL NOT PASS!"
    else
      IO.inspect "GOOD! Easy-peasy mate..."
    end
  end
end

# ListsAndRecursion-5
defmodule Hysteria do
  def all?(list, func) do
    Enum.reduce(list, true, fn element, truth -> func.(element) and truth end)
  end
end

listA = [1,2,3,4,5]
listB = [1,2,3]

T.is Enum.all?(listA, &(&1 < 4)), false
T.is Enum.all?(listB, &(&1 < 4)), true
T.is Hysteria.all?(listA, &(&1 < 4)), false
T.is Hysteria.all?(listB, &(&1 < 4)), true

# ListsAndRecursion-6
defmodule ApocalypsePlease do
  def flatten([]), do: []
  def flatten([ head | tail ]) when is_list(head), do: flatten(head) ++ flatten(tail)
  def flatten([ head | tail ]), do: [ head | flatten(tail) ]
end

messyList = [1,[2,3,[4]], 5, [[[6]]]]
T.is List.flatten(messyList), [1,2,3,4,5,6]
T.is ApocalypsePlease.flatten(messyList), [1,2,3,4,5,6]

# Ol' Fibo
IO.inspect Stream.unfold({0,1}, fn {f1,f2} -> {f1, {f2, f1+f2}} end) |> Enum.take(15)

# ListsAndRecursion-7
defmodule StockholmSyndrome do
  def getPrimes(list) do
    for x <- list, isPrime?(x), do: x
  end

  defp isPrime?(x) do
    list = Enum.into(2..(x - 1), [])
    |> Enum.map &(rem(x, &1))
    !Enum.any? list, &(&1 == 0)
  end
end

list = Enum.into 2..22, []
T.is StockholmSyndrome.getPrimes(list), [3, 5, 7, 11, 13, 17, 19]

# ListsAndRecursion-8
defmodule SingForAbsolution do
  @tax_rates [NC: 0.075, TX: 0.08]
  @orders [
    [id: 123, ship_to: :NC, net_amount: 100.00],
    [id: 124, ship_to: :OK, net_amount:  35.50],
    [id: 125, ship_to: :TX, net_amount:  24.00],
    [id: 126, ship_to: :TX, net_amount:  44.80],
    [id: 127, ship_to: :NC, net_amount:  25.00],
    [id: 128, ship_to: :MA, net_amount:  10.00],
    [id: 129, ship_to: :CA, net_amount: 102.00],
    [id: 130, ship_to: :NC, net_amount:  50.00],
  ]

  def yeah, do: Enum.map @orders, &(getTotalAmount(&1))

  # Hem... This is quite ugly
  # Improve: Convert the Keyword to a Map to avoid carrying `id` and `a`
  # Improve: Parse tax_rates to make the control flow dynamic
  defp getTotalAmount(a = [id: _, ship_to: :NC, net_amount: net]), do: Keyword.put(a, :total_amount, net * @tax_rates[:NC])
  defp getTotalAmount(a = [id: _, ship_to: :TX, net_amount: net]), do: Keyword.put(a, :total_amount, net * @tax_rates[:TX])
  defp getTotalAmount(a = [id: _, ship_to: _, net_amount: net]), do: Keyword.put(a, :total_amount, net)
end

IO.inspect SingForAbsolution.yeah
