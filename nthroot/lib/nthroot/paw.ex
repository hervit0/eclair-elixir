# From:
# https://stackoverflow.com/questions/32024156/how-do-i-raise-a-number-to-a-power-in-elixir

defmodule Paw do
  require Integer

  def pow(_, 0), do: 1
  def pow(x, n) when Integer.is_odd(n), do: x * pow(x, n - 1)

  def pow(x, n) do
    result = pow(x, div(n, 2))
    result * result
  end
end
