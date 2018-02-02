defmodule CloudyDay do
  def main() do
    [_towns_number, town_populations, town_locations] = [get_int(), get_array(), get_array()]
    [_clouds_numbers, cloud_locations, cloud_ranges] = [get_int(), get_array(), get_array()]

    maximum_population(town_populations, town_locations, cloud_locations, cloud_ranges)
    |> IO.puts()
  end

  defp get_io_ingress(), do: IO.gets("") |> String.trim()
  defp get_int(), do: get_io_ingress() |> String.to_integer()
  defp get_array(), do: get_io_ingress() |> String.split(" ") |> concurrent_map(&String.to_integer(&1))

  def maximum_population(town_populations, town_locations, cloud_locations, cloud_ranges) do
    towns_data = Enum.zip(town_locations, town_populations)

    cloud_permutations(cloud_locations)
    |> Enum.zip(cloud_permutations(cloud_ranges))
    |> concurrent_map(fn {locations, ranges} -> cloud_coverages(locations, ranges) end)
    |> concurrent_map(fn coverages -> population_under_sun(towns_data, coverages) end)
    |> Enum.max()
  end

  defp cloud_permutations(cloud_attributes) do
    1..length(cloud_attributes)
    |> concurrent_map(fn permutation ->
      cloud_attributes
      |> Enum.with_index(1)
      |> Enum.reject(fn {_, position} -> position == permutation end)
      |> concurrent_map(fn {attribute, _} -> attribute end)
    end)
  end

  defp cloud_coverages(locations, ranges) do
    Enum.zip(locations, ranges)
    |> concurrent_map(fn {location, range} -> (location - range)..(location + range) end)
  end

  defp population_under_sun(towns_data, cloud_coverages) do
    towns_data
    |> Enum.reject(fn {location, _} ->
      cloud_coverages |> concurrent_map(fn coverage -> location in coverage end) |> Enum.any?()
    end)
    |> Enum.reduce(0, fn {_, population}, acc -> acc + population end)
  end

  defp concurrent_map(collection, func) do
    collection
    |> Enum.map(&Task.async(fn -> func.(&1) end))
    |> Enum.map(&Task.await/1)
  end
end

# CloudyDay.main()
