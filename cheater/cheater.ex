defmodule Cheater do
  def remov_nb(n) do
    numbers = 1..n |> Enum.to_list()
    sum = Enum.sum(numbers)

    do_get(numbers, sum, [])
  end

  def get_combinations(n) do
    numbers = 1..n |> Enum.to_list()
    do_combinations(numbers, {}, [])
  end

  def do_combinations([], _branch, combinations), do: combinations
  def do_combinations([current | rest], branch, combinations) do
    branch_with_current = Tuple.append(branch, current)

    new_combinations = rest |> Enum.map(fn x ->
      new_branch = Tuple.append(branch_with_current, x)
      # new_combinations = if tuple_size(new_branch) == 2 do
      #   [new_branch | combinations]
      # else
      #   combinations
      # end
      # IO.inspect new_combinations
      # do_combinations(rest, new_branch, new_combinations)
    end)

    # case tuple_size(branch_with_current) do
    #   2 -> [branch_with_current | combinations]
    #   _ -> do_combinations(rest, {}, combinations)
    # end
    do_combinations(rest, {}, new_combinations ++ combinations)
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
