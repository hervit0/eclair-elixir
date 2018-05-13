defmodule RecreationOne do
  def list_squared(m, n) do
    m..n
    |> Enum.reduce([], fn x, acc ->
      case process(x) do
        {:ok, divisors_sum} -> [{x, divisors_sum} | acc]
        _ -> acc
      end
    end)
    |> Enum.reverse()
  end

  defp process(number) do
    KprimeFactor.get_divisors(number)
    |> Enum.map(&(&1 * &1))
    |> Enum.sum()
    |> is_squared?()
  end

  defp is_squared?(number) do
    square_root = :math.sqrt(number) |> trunc()
    if number == square_root * square_root, do: {:ok, number}, else: {:nope}
  end
end

defmodule KprimeFactor do
  def get_divisors(1), do: [1]

  def get_divisors(x) do
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
