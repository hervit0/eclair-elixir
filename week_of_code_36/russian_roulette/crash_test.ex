defmodule RussianRoulette do
  def main() do
    _doors_number = IO.gets("") |> String.trim() |> String.to_integer()

    doors = get_doors() |> solve() |> IO.puts()
  end

  defp get_doors() do
    IO.gets("") |> String.trim() |> String.split(" ") |> Enum.map(&String.to_integer(&1))
  end

  def solve(doors) do
    locked_doors = Enum.count(doors, fn door -> door == 1 end)
    operations = get_operations(doors, all_unlocked?(doors), 0)
    [locked_doors, operations] |> Enum.join(" ")
  end

  defp all_unlocked?(doors), do: Enum.all?(doors, fn door -> door == 0 end)

  defp get_operations(_doors, true, operations), do: operations

  defp get_operations(doors, false, operations) do
    # Do some crazy stuff - really functional but not really efficient
    get_operations(new_doors, all_unlocked?(doors), operations + 1)
  end
end

# RussianRoulette.main()
