defmodule AcidNaming do
  def main() do
    chemical_components = IO.gets("") |> String.trim() |> String.to_integer()

    1..chemical_components
    |> Enum.map(fn _ -> get_component() end)
    |> Enum.map(&acid_classify(&1))
    |> Enum.each(fn classification -> IO.puts(classification) end)
  end

  def get_component(), do: IO.gets("") |> String.trim()

  def acid_classify(component) do
    case fragment(component) do
      {true, true} -> "non-metal acid"
      {false, true} -> "polyatomic acid"
      {false, false} -> "not an acid"
    end
  end

  def fragment(component) do
    {String.starts_with?(component, "hydro"), String.ends_with?(component, "ic")}
  end
end

# AcidNaming.main()
