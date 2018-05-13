# Found better solutions

defmodule RecreationOne do
  def list_squared(m, n) do
    m..n
    |> Enum.map(fn x -> {x, div_sum(x)} end)
    |> Enum.filter(fn x -> x |> elem(1) |> squared end)
  end

  defp div_sum(num) do
    num
    |> :math.sqrt()
    |> round
    |> linspace
    |> Enum.filter(fn x -> rem(num, x) === 0 end)
    |> Enum.map(fn x -> [x, div(num, x)] end)
    |> List.flatten()
    |> Enum.uniq()
    |> Enum.reduce(0, fn num, acc -> acc + num * num end)
  end

  defp linspace(num), do: 1..num

  defp squared(num) do
    sqrt = :math.sqrt(num)
    sqrt_i = Float.floor(sqrt)

    sqrt == sqrt_i
  end
end

# Readable one
defmodule RecreationOne do
  def list_squared(m, n) do
    m..n
    |> Enum.map(&squared_divisor/1)
    |> Enum.filter(fn x -> x != nil end)
  end

  defp squared_divisor(m) do
    val =
      divisors(m)
      |> Enum.map(&(&1 * &1))
      |> Enum.sum()

    case is_square?(val) do
      false -> nil
      true -> {m, val}
    end
  end

  def divisors(m) do
    1..trunc(:math.sqrt(m))
    |> Enum.filter(fn x -> rem(m, x) == 0 end)
    |> Enum.flat_map(fn x -> [x, trunc(m / x)] end)
    |> Enum.uniq()
  end

  def is_square?(v) do
    sqrt = :math.sqrt(v)
    sqrt == trunc(sqrt)
  end
end
