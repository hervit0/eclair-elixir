# Newton convergence algorithm:
# https://en.wikipedia.org/wiki/Nth_root_algorithm

defmodule NthrootCalculator do
  @tolerance 0.01
  @default_guess 1
  @digits 5

  def root(x, _n) when x < 0, do: raise("Nth root for a negative number, are you sure?")

  def root(x, n) when n < 0, do: roundup(1 / root(x, -n))

  def root(x, n), do: _root(x, n, false, @default_guess)

  defp _root(_x, _n, true, solution), do: roundup(solution)

  defp _root(x, n, false, guess) do
    next_guess = guess - froot(guess, x, n) / frootprime(guess, n)
    acceptance = abs(next_guess - guess) / @tolerance < @tolerance
    _root(x, n, acceptance, next_guess)
  end

  defp froot(guess, x, n), do: Paw.pow(guess, n) - x

  defp frootprime(guess, n), do: Paw.pow(guess, n - 1) * n

  defp roundup(number), do: Float.round(number, @digits)
end
