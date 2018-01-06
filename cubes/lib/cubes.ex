defmodule Cubes do
  def find_nb(m) do
    _find(m, 0, 1)
  end

  def _find(m, n, r) when m == r, do: n + 1
  def _find(m, _n, r) when m < r, do: -1

  def _find(m, old_n, r) do
    n = old_n + 1
    result = r + :math.pow(n + 1, 3)
    _find(m, n, result)
  end
end
