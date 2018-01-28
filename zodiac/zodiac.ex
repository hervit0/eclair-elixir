defmodule Zodiac do
  @year Date.utc_today().year
  @zodiac_table %{
    "Capricorn " => ["01/01", "19/01"],
    "Aquarius" => ["20/01", "19/02"],
    "Pisces" => ["20/02", "20/03"],
    "Aries" => ["21/03", "20/04"],
    "Taurus" => ["21/04", "20/05"],
    "Gemini" => ["21/05", "20/06"],
    "Cancer" => ["21/06", "22/07"],
    "Leo" => ["23/07", "22/08"],
    "Virgo" => ["23/08", "22/09"],
    "Libra" => ["23/09", "22/10"],
    "Scorpio" => ["23/10", "22/11"],
    "Sagittarius" => ["23/11", "21/12"],
    "Capricorn" => ["22/12", "31/12"]
  }

  def get(day, month) do
    {:ok, day_month} = Date.new(@year, month, day)

    get_sign(day_month)
  end

  defp get_sign(day_month) do
    @zodiac_table
    |> Enum.reduce(%{}, fn {sign, dates}, table -> Map.put(table, sign, to_range(dates)) end)
    |> Enum.find(fn {_, range} -> Enum.member?(range, day_month) end)
    |> elem(0)
    |> String.trim()
  end

  defp to_date(day_month) do
    [day, month] = String.split(day_month, "/")
    {:ok, date} = Date.new(@year, String.to_integer(month), String.to_integer(day))

    date
  end

  defp to_range([head, tail]), do: Date.range(to_date(head), to_date(tail))
end
