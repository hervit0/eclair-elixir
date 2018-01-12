ExUnit.start()

defmodule TravelTest do
  Code.require_file("./travel.ex")
  use ExUnit.Case

  test "it returns the best route" do
    # routes = [50, 55, 57, 58, 60]
    routes = [950, 955, 957, 958, 960]
    min_towns = 3
    max_distance = 174

    expected_best_route = [55, 58, 60]
    best_route = Travel.best_route(routes, min_towns, max_distance)
    IO.puts best_route
    # IO.inspect best_route
    assert best_route == expected_best_route
  end
end
