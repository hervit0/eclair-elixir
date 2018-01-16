defmodule DurationFormatter do
  @labels ["year", "day", "hour", "minute", "second"]

  def format_duration(seconds) when seconds <= 0, do: "now"

  def format_duration(tot_seconds) do
    values =
      with {tot_minutes, seconds} <- euclidean(tot_seconds, 60),
           {tot_hours, minutes} <- euclidean(tot_minutes, 60),
           {tot_days, hours} <- euclidean(tot_hours, 24),
           {years, days} <- euclidean(tot_days, 365) do
        [years, days, hours, minutes, seconds]
      end

    @labels
    |> Enum.zip(values)
    |> Enum.map(fn {label, value} -> stamp(label, value) end)
    |> Enum.reject(fn stamp -> stamp == "" end)
    |> etiquette("")
  end

  defp euclidean(tot, base), do: {div(tot, base), rem(tot, base)}

  defp stamp(_label, 0), do: ""
  defp stamp(label, 1), do: Enum.join([1, label], " ")
  defp stamp(label, value), do: Enum.join([value, Enum.join([label, "s"])], " ")

  defp etiquette([last_stamp], da_etiquette) do
    Enum.join([da_etiquette, last_stamp])
  end

  defp etiquette([stamp | [last_stamp]], da_etiquette) do
    etiquette([last_stamp], Enum.join([da_etiquette, stamp, " and "]))
  end

  defp etiquette([stamp | stamps], da_etiquette) do
    etiquette(stamps, Enum.join([da_etiquette, stamp, ", "]))
  end
end
