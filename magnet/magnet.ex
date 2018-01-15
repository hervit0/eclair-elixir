defmodule Magnet do
    def doubles(maxk, maxn) do
        (for k <- 1..maxk, n <- 1..maxn, do: {k, n})
        |> Enum.reduce(0, fn ({k, n}, acc) -> 1 / (k * :math.pow(n + 1, 2 * k)) + acc end)
    end
end
