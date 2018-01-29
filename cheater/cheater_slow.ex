defmodule Cheater do
  def remov_nb(n) do
    numbers = 1..n |> Enum.to_list()
    sum = Enum.sum(numbers)

    do_get(numbers, sum, [])
  end

  defp do_get([], _sum, result), do: result

  defp do_get([e1 | rest], sum, result) do
    do_get(rest, sum, get_couples(e1, rest, sum) ++ result)
  end

  defp get_couples(e1, numbers, sum) do
    numbers
    |> Enum.filter(fn e2 -> sum - e1 - e2 == e2 * e1 end)
    |> Enum.flat_map(fn x -> [{e1, x}, {x, e1}] end)
  end
end
