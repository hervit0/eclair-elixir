defmodule TestSetup do
  use ExUnit.Case

  test "get the input format" do
    path = "test/testcases/input/input00.txt"

    assert friendly_parse(path) == ["3", "275 214 420", "6 9 11", "199 199 255"]
  end

  test "get the output format" do
    path = "test/testcases/output/output00.txt"
    assert friendly_parse(path) == ["69", "4", "143"]
  end

  test "get list of testcase files" do
    path = "test/testcases/input"

    input_files =
      File.ls!(path)
      |> Enum.map(&Path.join(path, &1))

    output_files =
      input_files
      |> Enum.map(&String.replace(&1, "input", "output"))

    Enum.zip(input_files, output_files)
  end

  defp friendly_parse(path) do
    File.read!(path)
    |> String.trim()
    |> String.split("\n")
  end
end
