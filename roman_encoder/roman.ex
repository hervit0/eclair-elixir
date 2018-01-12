defmodule Table do
 defstruct [:rank, :multiple]
end

defmodule Roman do
  @table %{
    "I" => %Table{rank: 1, multiple: 1},
    "V" => %Table{rank: 1, multiple: 5},
    "X" => %Table{rank: 2, multiple: 1},
    "L" => %Table{rank: 2, multiple: 5},
    "C" => %Table{rank: 3, multiple: 1},
    "D" => %Table{rank: 3, multiple: 5},
    "M" => %Table{rank: 4, multiple: 1},
  }

  def encode(arabic) when arabic <= 0, do: ""
  def encode(arabic) do
    arabic
    |> Integer.to_string
    |> String.codepoints
    |> Enum.reverse
    |> Stream.with_index(1) 
    |> Enum.reduce(%{}, fn({v,k}, acc)-> Map.put(acc, k, String.to_integer(v)) end)
    |> Enum.map(fn {rank, value} -> _encode(rank, value) end)
    |> Enum.reverse
    |> Enum.join
  end

  defp _encode(rank, value) when value <= 3 do
    String.duplicate(symbol(rank, 1), value)
  end

  defp _encode(rank, value) when value == 4 do
    symbol(rank, 1) <> symbol(rank, 5)
  end

  defp _encode(rank, value) when value == 5 do
    symbol(rank, 5)
  end

  defp _encode(rank, value) when value == 9 do
    symbol(rank, 1) <> symbol(rank + 1, 1)
  end

  defp _encode(rank, value) when value >= 6 do
    symbol(rank, 5) <> String.duplicate(symbol(rank, 1), rem(value, 5))
  end

  defp _encode(_, _), do: ""

  defp symbol(rank, multiple) do
    @table
    |> Enum.find(fn {_, v} -> v.rank == rank and v.multiple == multiple end)
    |> elem(0)
  end
end
