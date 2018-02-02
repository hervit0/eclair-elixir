defmodule ComboMeal do
  def main() do
    scenarios_number = IO.gets("") |> String.trim() |> String.to_integer()

    1..scenarios_number
    |> Enum.map(fn _ -> get_profit() end)
    |> Enum.each(fn profit -> IO.puts(profit) end)
  end

  defp get_profit() do
    [burger, soda, meal] =
      IO.gets("") |> String.trim() |> String.split(" ") |> Enum.map(&String.to_integer(&1))

    burger + soda - meal
  end
end

ComboMeal.main()
