defmodule ComboMeal do
  def main() do
    scenarios_number = IO.gets("") |> String.trim() |> String.to_integer()

    1..scenarios_number
    |> Enum.map(fn _ -> get_menu() end)
    |> Enum.map(&get_profit(&1))
    |> Enum.each(fn profit -> IO.puts(profit) end)
  end

  defp get_menu() do
    IO.gets("") |> String.trim() |> String.split(" ") |> Enum.map(&String.to_integer(&1))
  end

  defp get_profit([burger, soda, meal]), do: burger + soda - meal
end

ComboMeal.main()
