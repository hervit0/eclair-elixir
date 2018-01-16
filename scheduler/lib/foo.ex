defmodule Scheduler.Foo do
  def hit_frequently() do
    IO.puts("Wow, it's now:")
    IO.inspect(DateTime.utc_now())
  end

  def hit_once() do
    IO.puts("SHOT!")
    IO.inspect(DateTime.utc_now())
  end
end
