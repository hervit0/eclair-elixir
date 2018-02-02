defmodule Parallel do
  def pmap(collection, func) do
    collection
    |> Enum.map(&Task.async(fn -> func.(&1) end))
    |> Enum.map(&Task.await/1)
  end
end

fun = fn x ->
  :timer.sleep(1000)
  IO.puts x
end

# t1 = :os.system_time(:millisecond)
# Enum.map(1..10, fun)
# t2 = :os.system_time(:millisecond)
# IO.puts("Time elapsed (ms):")
# IO.puts(t2 - t1)

t1 = :os.system_time(:millisecond)
Parallel.pmap(1..10, fun)
t2 = :os.system_time(:millisecond)
IO.puts("Time elapsed (ms):")
IO.puts(t2 - t1)
