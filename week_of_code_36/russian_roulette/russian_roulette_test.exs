ExUnit.start()

defmodule TestRussianRoulette do
  Code.require_file("./russian_roulette.ex")
  use ExUnit.Case

  test "acid_naming" do
    input = "0 1 1 0 1 1 1 1 0 0"
    |> treat_the_input_such_a_waste_of_time()

    assert RussianRoulette.solve(input) == "3 6"
  end

  defp treat_the_input_such_a_waste_of_time(input) do
    input
    |> String.trim()
    |> String.split(" ")
    |> Enum.map(&String.to_integer(&1))
  end
end
