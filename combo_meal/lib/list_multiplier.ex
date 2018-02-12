defmodule Solution do
  def input() do
    IO.stream(:stdio, :line)
    |> Enum.to_list()
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
  end

  def main([multiplier | list]) do
    Enum.reduce(list, [], fn item, acc -> acc ++ List.duplicate(item, multiplier) end)
  end

  def output(solution) do
    solution |> Enum.each(&IO.puts(&1))
  end
end

Solution.input() |> Solution.main() |> Solution.output()
