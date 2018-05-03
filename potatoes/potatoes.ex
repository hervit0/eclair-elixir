defmodule Potatoes do
  @spec potatoes(integer, integer, integer) :: integer
  def potatoes(p0, w0, p1) do
    dry_matter = w0 * (1 - p0 / 100)
    output_weight = dry_matter / (1 - p1 / 100)

    :erlang.float_to_binary(output_weight, decimals: 1)
    |> String.split(".")
    |> List.first()
    |> String.to_integer()
  end
end
