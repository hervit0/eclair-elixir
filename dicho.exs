defmodule Dicho do
  def guess(target, range) do
    median = median(range)
    IO.puts median
    try(median, target, range)
  end

  # def try(median, target, _) when median == target do
  def try(median, median, _) do
    IO.puts "Solution:"
    IO.puts median
  end

  def try(median, target, lowerBound.._) when median > target do
    guess(target, lowerBound..median)
  end

  def try(median, target, _..upperBound) when median < target do
    guess(target, median..upperBound)
  end

  def median(lowerBound..upperBound) do
    lowerBound + div((upperBound - lowerBound), 2)
  end
end

Dicho.guess(123, (0..1000))
Dicho.guess(501, (0..1000))
