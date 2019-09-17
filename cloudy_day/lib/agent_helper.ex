defmodule AgentHelper do
  use Agent

  def start_link(_opts) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def get(cases) do
    current_value = Agent.get(__MODULE__, &Map.get(&1, "index")) || 0
    set(current_value + 1)
    Enum.at(cases, current_value)
  end

  def set(value), do: Agent.update(__MODULE__, &Map.put(&1, "index", value))

  def put(value) do
    output = [value | get_io_puts()]
    Agent.update(__MODULE__, &Map.put(&1, "io_puts", output))
  end

  def get_io_puts(), do: Agent.get(__MODULE__, &Map.get(&1, "io_puts")) || []

  def assert_captured_io(:integer) do
    get_io_puts() |> Enum.map(&Integer.to_string(&1)) |> Enum.reverse()
  end

  def assert_captured_io(), do: get_io_puts() |> Enum.reverse()

  def friendly_parse(path) do
    File.read!(path)
    |> String.trim()
    |> String.split("\n")
  end
end
