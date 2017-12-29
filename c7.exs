defmodule T do
  def is(result, expectation) do
    IO.inspect result
    IO.inspect result == expectation
  end
end

# ListsAndRecursion-1
defmodule Sunburn do
  def mapsum(list, func), do: _mapsum(list, func, 0)

  defp _mapsum([], _, total), do: total
  defp _mapsum([ head | tail ], func, total), do: _mapsum(tail, func, func.(head) + total)
end

T.is(Sunburn.mapsum([1,2,3], &(&1 * &1)), 14)

# ListsAndRecursion-2
defmodule MuscleMuseum do
  def myMax(list) do
    [ head | _ ] = list
    _myMax(list, head)
  end

  defp _myMax([], best), do: best
  defp _myMax([ head | tail ], best) when head > best, do: _myMax(tail, head)
  defp _myMax([ _head | tail ], best), do: _myMax(tail, best)
end

T.is(MuscleMuseum.myMax([1, 2, 3]), 3)
T.is(MuscleMuseum.myMax([46, 48, 41]), 48)
T.is(MuscleMuseum.myMax([1000, 42, 41]), 1000)

# ListsAndRecursion-3
defmodule NewBorn do
  def caesar([], _n), do: []
  def caesar([ head | tail ], n) when head + n < 122, do: [ head + n | caesar(tail, n) ]
  def caesar([ _head | tail ], n), do: [ '?' | caesar(tail, n) ]
end

IO.puts NewBorn.caesar('ryvkve', 13)

# ListsAndRecursion-3
defmodule MapOfProblematicSlow do
  def span(from, to), do: _span(from, to, [from])

  defp _span(to, to, spanList), do: spanList
  defp _span(from, to, spanList) do
    _span(from + 1, to, spanList ++ [from +  1])
  end
end

defmodule MapOfProblematic do
  def span(from, to) when from > to, do: []
  def span(from, to), do: [ from | span(from + 1, to) ]
end

T.is(MapOfProblematicSlow.span(1, 5), [1,2,3,4,5])
T.is(MapOfProblematic.span(1, 5), [1,2,3,4,5])
