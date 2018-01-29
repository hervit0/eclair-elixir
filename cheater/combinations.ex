# from https://github.com/tallakt/comb
# not fast enough for Combinations.combinations(1..10000, 2)
defmodule Combinations do
  def combinations(enum, k) do
    List.last(do_combinations(enum, k))
    |> Enum.uniq()
  end

  defp do_combinations(enum, k) do
    combinations_by_length = [[[]] | List.duplicate([], k)]

    list = Enum.to_list(enum)

    List.foldr(list, combinations_by_length, fn x, next ->
      sub = :lists.droplast(next)
      step = [[] | for(l <- sub, do: for(s <- l, do: [x | s]))]
      :lists.zipwith(&:lists.append/2, step, next)
    end)
  end
end
