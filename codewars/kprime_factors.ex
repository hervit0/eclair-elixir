defmodule KprimeFactor do
  def get(1), do: [1]
  def get(x) do
    kprimes = do_get(x, 2, [1])

    kprimes
    |> Enum.reduce([], fn kprime, divisors ->
      [kprime | divisors] ++ Enum.map(divisors, fn divisor -> divisor * kprime end)
    end)
    |> Enum.uniq()
  end

  defp do_get(number, number, results), do: [number | results]

  defp do_get(number, 2, results) do
    if rem(number, 2) == 0 do
      do_get(div(number, 2), 2, [2 | results])
    else
      do_get(number, 3, results)
    end
  end

  defp do_get(number, divisor, results) do
    if rem(number, divisor) == 0 do
      do_get(div(number, divisor), divisor, [divisor | results])
    else
      do_get(number, divisor + 2, results)
    end
  end
end

KprimeFactor.get(2) |> IO.inspect()
KprimeFactor.get(720) |> IO.inspect()
KprimeFactor.get(42) |> Enum.sum() |> IO.inspect()
