defmodule Travel do
  def best_route(routes, min_towns, max_distance) do
    all_routes(routes, 1, min_towns)
  end
    # routes = [950, 955, 957, 958, 960]

  defp all_routes([], _, _), do: []
  defp all_routes([r | _], n, mt) when n == mt, do: r
  defp all_routes([r | rs], n, mt) when n < mt do
    IO.inspect "N.............."
    IO.inspect n
    IO.inspect "RS........"
    IO.inspect rs
    IO.inspect "SUBROUTES........"
    IO.inspect sub_routes(rs)
 
    sub_routes(rs)
    |> Enum.map(fn sub_route -> [r | all_routes(sub_route, n + 1, mt)] end)
  end

  defp sub_routes(routes) do
    routes_index = routes
    |> Enum.with_index
    
    a = routes_index
    |> Enum.reduce([], fn ({_, i}, acc) -> 
      acc
      |> Enum.concat([
        routes_index
        |> Enum.reject(fn {_, j} -> j == i end)
        |> Enum.map(fn {x, _} -> x end)
      ])
    end)
  end
end
