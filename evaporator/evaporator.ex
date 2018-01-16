defmodule Evaporator do
  @spec evaporator(number, number, number) :: number

  def evaporator(content, evap_per_day, threshold) do
    get_remaining_days(content, evap_per_day, threshold, 0, false)
  end

  def get_remaining_days(_content, _evap_per_day, _threshold, days, true), do: days

  def get_remaining_days(content, evap_per_day, threshold, duration, _acceptance) do
    new_duration = duration + 1
    new_content = content * :math.pow(1 - evap_per_day / 100, new_duration)
    acceptance = new_content / content < threshold / 100
    get_remaining_days(content, evap_per_day, threshold, new_duration, acceptance)
  end
end
