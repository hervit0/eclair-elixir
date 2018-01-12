defmodule Roman do
  @table %{
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000,
  }

  def decode(roman) do
    parsed_number = roman
    |> String.codepoints
    |> Enum.reverse
    |> Enum.map(&(@table[&1]))

    _decode(parsed_number, 0, 0)
  end

  defp _decode([], _prev, sum), do: sum

  defp _decode([h | t], prev, sum) when h >= prev do 
    _decode(t, h, sum + h)
  end

  defp _decode([h | t], prev, sum) when h < prev do 
    _decode(t, h, sum - h)
  end
end
