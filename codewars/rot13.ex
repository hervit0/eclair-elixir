# ROT13 is a simple letter substitution cipher that replaces a letter with the letter 13 letters after it in the alphabet. ROT13 is an example of the Caesar cipher.

# Create a function that takes a string and returns the string ciphered with Rot13. If there are numbers or special characters included in the string, they should be returned as they are. Only letters from the latin/english alphabet should be shifted, like in the original Rot13 "implementation".

defmodule Encryptor do
  def rot13(string) do
    alphabet = for n <- ?a..?z, do: <<n::utf8>>
    rot13_alphabet = Enum.drop(alphabet, 13) ++ Enum.take(alphabet, 13)

    build_table = fn {k, v}, table ->
      Enum.into(table, %{k => v, String.upcase(k) => String.upcase(v)})
    end

    translation_table = Enum.zip(alphabet, rot13_alphabet) |> Enum.reduce(%{}, build_table)

    translate = fn char -> Map.get(translation_table, char, char) end

    String.codepoints(string)
    |> Enum.map(translate)
    |> List.to_string()
  end
end

# assert "Grfg" == rot13("Test")
Encryptor.rot13("C[\\V69NTP@<G>U?8=AE^ROD0Ya]`3KM5QI_SXHL:;B427JZW1F")
|> IO.inspect()
