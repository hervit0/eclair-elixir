defmodule Braces do
  @opening_parenthesis 40
  @closing_parenthesis 41
  @opening_bracket 123
  @closing_bracket 125
  @opening_curly 91
  @closing_curly 93

  @openings [@opening_bracket, @opening_curly, @opening_parenthesis]

  def valid_braces(braces_string) do
    compliances =
      braces_string
      |> String.to_charlist()
      |> Enum.reduce([], &get_compliance/2)

      length(compliances) == 0
    end

  defp get_compliance(bracket, acc) when bracket in @openings, do: [bracket | acc]

  defp get_compliance(@closing_bracket, [@opening_bracket | rest]), do: rest
  defp get_compliance(@closing_parenthesis, [@opening_parenthesis | rest]), do: rest
  defp get_compliance(@closing_curly, [@opening_curly | rest]), do: rest

  defp get_compliance(closing_bracket, acc), do: acc ++ [closing_bracket]
end
