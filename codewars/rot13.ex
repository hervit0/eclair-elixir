# ROT13 is a simple letter substitution cipher that replaces a letter with the letter 13 letters after it in the alphabet. ROT13 is an example of the Caesar cipher.

# Create a function that takes a string and returns the string ciphered with Rot13. If there are numbers or special characters included in the string, they should be returned as they are. Only letters from the latin/english alphabet should be shifted, like in the original Rot13 "implementation".

defmodule Encryptor do
  def rot13(string) do
    alphabet = for n <- ?a..?z, do: <<n::utf8>>
    rot13_alphabet = Enum.drop(alphabet, 13) ++ Enum.take(alphabet, 13)
    translation_table = Enum.zip(alphabet, rot13_alphabet) |> Enum.into(%{})

    String.codepoints(string)
    |> Enum.map(&translate(&1, translation_table))
    |> List.to_string()
  end

  defp translate(char, translation_table) do
    do_translate(char, Regex.match?(~r/[a-zA-Z]/, char), translation_table)
  end

  defp do_translate(char, false, _), do: char

  defp do_translate(char, true, translation_table) do
    case Regex.match?(~r/^[A-Z]+$/, char) do
      false -> translation_table[char]
      _ -> translation_table[String.downcase(char)] |> String.upcase()
    end
  end
end

# assert "Grfg" == rot13("Test")
Encryptor.rot13("C[\\V69NTP@<G>U?8=AE^ROD0Ya]`3KM5QI_SXHL:;B427JZW1F")
|> IO.inspect()

# On the Web, cleaner with default the Map.get/3
  # def rot13(string) do
  #   abc = String.codepoints("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
  #   mno = String.codepoints("nopqrstuvwxyzabcdefghijklmNOPQRSTUVWXYZABCDEFGHIJKLM")

  #   transform = Enum.zip(abc, mno) |> Map.new(fn {k, v} -> {k, v} end)

  #   String.codepoints(string) |> Enum.map(fn c -> Map.get(transform, c, c) end) |> Enum.join
  # end
