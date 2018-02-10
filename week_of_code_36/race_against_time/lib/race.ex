defmodule Race do
  def main() do
    last_position = get_integer()
    height = get_integer()
    heights = get_array()
    prices = get_array()

    get_node_cost(heights, prices, height, last_position)
  end

  defp get_node_cost(heights, prices, height, last_position) do
    {mandatory_height, mandatory_position} = mandatory_stop(heights, height, last_position)
    current_cost_target = get_stop_cost(mandatory_height, mandatory_position, height)

    heights
    |> Stream.zip(prices)
    |> Stream.take(mandatory_position)
    |> Stream.with_index()
    |> Stream.map(fn {{height, price}, index} ->
      node_heights |> Stream.take(mandatory_position) |> Stream.drop(index)
      # IT'S GETTING HAIRY
      get_cost(height, price, node_heights, mandatory_position)
    end)
    # Filtering without forgetting old nodes
    |> Stream.filter(fn node_cost -> is_node_valuable(node_cost, current_cost_target) end)
  end

  defp is_node_valuable(node_cost, current_cost_target) do
    node_cost + current_cost_target < current_cost_target
  end

  defp get_cost(stop_height, stop_price, current_height, node_heights, last_position) do
    local_cost = get_stop_cost(stop_height, stop_price, current_height)

    case mandatory_stop(node_heights, stop_height, last_position) do
      {_, last_position} -> local_cost
      # HERE get_node_cost mate
      {new_mandatory_height, new_mandatory_position} -> local_cost + get_node_cost()
    end
  end

  defp get_stop_cost(stop_height, stop_price, current_height) do
    abs(stop_height - current_height) + stop_price
  end

  defp mandatory_stop(heights, current_height, last_position) do
    mandatory_optional =
      heights
      |> Stream.with_index()
      |> Stream.filter(fn {x, i} -> x > current_height end)
      |> Enum.take(1)

    case mandatory_optional do
      [{height, position}] -> {height, position}
      [] -> {current_height, last_position}
    end
  end

  defp get_integer, do: IO.gets("") |> String.trim() |> String.to_integer()

  defp get_stream do
    IO.gets("") |> String.trim() |> String.split(" ") |> Stream.map(&String.to_integer(&1))
  end
end

# Race.main()
