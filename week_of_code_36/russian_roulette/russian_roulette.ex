defmodule RussianRoulette do
  def main() do
    _doors_number = IO.gets("") |> String.trim() |> String.to_integer()

    get_doors() |> solve() |> IO.puts()
  end

  defp get_doors() do
    IO.gets("") |> String.trim() |> String.split(" ") |> Enum.map(&String.to_integer(&1))
  end

  def solve(doors) do
    [get_operations(doors), Enum.count(doors, &(&1 == 1))] |> Enum.join(" ")
  end

  defp get_operations(doors) do
    doors
    |> Enum.chunk_by(&(&1 == 1))
    |> Enum.filter(&(1 in &1))
    |> Enum.reduce(0, fn batch, acc -> acc + operations(length(batch)) end)
  end

  defp operations(batch), do: div(batch, 2) + rem(batch, 2)
end

RussianRoulette.main()
