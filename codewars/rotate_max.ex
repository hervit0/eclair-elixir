defmodule Maxrot do
  def max_rot(num) do
    root = num |> Integer.to_string()
    list = root |> String.codepoints()

    stuff(list, 0, [root])
    |> Enum.map(&String.to_integer/1)
    |> Enum.max()
  end

  defp stuff(list, counter, results) when length(list) == counter, do: results

  defp stuff(list, counter, results) do
    head = list |> Enum.take(counter)
    tail = list |> Enum.drop(counter) |> rotate_left()
    new_list = head ++ tail

    new_results = [Enum.join(new_list) | results]

    stuff(new_list, counter + 1, new_results)
  end

  defp rotate_left([]), do: []
  defp rotate_left([h | t]), do: t ++ [h]
end
