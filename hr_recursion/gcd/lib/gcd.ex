defmodule Gcd do
  def main() do
    [x, y] = IO.gets("") |> String.trim() |> String.split(" ") |> Enum.map(&String.to_integer(&1))

    gcd(x, y)
    |> IO.puts()
  end

  defp gcd(x, x), do: x
  defp gcd(x, y) when x > y, do: gcd(x - y, y)
  defp gcd(x, y), do: do_gcd(x, rem(y, x), x)

  defp do_gcd(_divisor, 0, last_remainder), do: last_remainder

  defp do_gcd(divisor, remainder, _last_remainder) do
    do_gcd(remainder, rem(divisor, remainder), remainder)
  end
end

Gcd.main()
