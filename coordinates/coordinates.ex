defmodule Coordinates do
  def isValidCoordinates(coordinates) do
    case hasLetters(coordinates) do
      true ->
        false

      false ->
        case coordinates |> String.split(",") do
          latLong when length(latLong) == 2 -> validate(latLong)
          _ -> false
        end
    end
  end

  defp hasLetters(coordinates), do: Regex.match?(~r/[a-z]/, coordinates)

  defp validate(latLong) do
    parsedCoordinates =
      latLong
      # |> Enum.map(&String.lstrip/1)
      |> Enum.map(&String.trim/1)
      |> Enum.map(&Float.parse/1)

    case parsedCoordinates do
      [{lat, ""}, {long, ""}] -> !checkRange(lat, long)
      _ -> false
    end
  end

  defp checkRange(lat, long) do
    [validateLat(lat), validateLong(long)]
    |> Enum.any?(&(&1 == false))
  end

  defp validateLat(lat), do: lat >= -90 and lat <= 90
  defp validateLong(long), do: long >= -180 and long <= 180
end

# I really like this one beneath!

# defmodule Solution do
#   def isValidCoordinates(coordinates) do
#     [{lat, ""}, {lng, ""}] = coordinates |> String.split(~r/, ?/) |> Enum.map(&Float.parse/1)
#     abs(lat) <= 90 and abs(lng) <= 180 and Regex.match?(~r/^[-., 0-9]+$/, coordinates)
#   rescue
#     MatchError -> false
#   end
# end
