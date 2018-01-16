defmodule Ip do
  @spec validate(string) :: boolean
  @range 0..255

  def validate(ip) do
    trailing_space_acceptance = ip =~ " "
    frags = String.split(ip, ".")
    length_acceptance = length(frags) == 4

    integer_acceptance =
      frags
      |> Enum.map(&check/1)
      |> Enum.any?(&(&1 == false))

    !trailing_space_acceptance && length_acceptance && !integer_acceptance
  end

  def check(fragment) do
    integer_acceptance = is_valid_integer(Integer.parse(fragment))
    trailing_zero_acceptance = is_valid_trailing(String.starts_with?(fragment, "0"), fragment)
    integer_acceptance && trailing_zero_acceptance
  end

  defp is_valid_integer({i, _}), do: Enum.member?(@range, i)
  defp is_valid_integer(_), do: false

  defp is_valid_trailing(false, _), do: true
  defp is_valid_trailing(true, fragment) when fragment != "0", do: false
  defp is_valid_trailing(true, fragment) when fragment == "0", do: true
end
