defmodule Cheater do
  def remov_nb(n) do
    numbers = 1..n |> Enum.to_list()
    sum = Enum.sum(numbers)

    {_, results} = Enum.reduce(numbers, {[], []}, &do_get(sum, &2, &1))
    results
  end


  defp do_get(sum, {seen_numbers, results}, number) do
    new_results =
      results ++
        Enum.reduce(seen_numbers, [], fn seen, acc ->
          if sum - seen - number == seen * number do
            [{seen, number}, {number, seen} | acc]
          else
            acc
          end
        end)

    {[number | seen_numbers], new_results}
  end
end

Cheater.remov_nb(1006)
