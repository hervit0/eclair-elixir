# Boiler from Hackerrank
# Input
# 2
# 3
# Output
# 5

# Nota: Pretty annoying...

defmodule Solution do
  defp sum(a, b), do: a + b

  def main() do
    a = IO.gets("") |> String.strip() |> String.to_integer()
    b = IO.gets("") |> String.strip() |> String.to_integer()
    sum(a, b) |> IO.puts()
  end
end

Solution.main()
