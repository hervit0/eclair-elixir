defmodule TestComboMeal do
  use ExUnit.Case

  import Mock

  test "combo_meal" do
    testcases()
    |> Enum.each(fn {input_file, output_file} -> run_test(input_file, output_file) end)
  end

  defp run_test(input_file, output_file) do
    cases = AgentHelper.friendly_parse(input_file)
    output = AgentHelper.friendly_parse(output_file)

    io_mocks = [
      gets: fn _ -> AgentHelper.get(cases) end,
      puts: fn input -> AgentHelper.put(input) end,
      inspect: fn input -> IO.inspect(input) end
    ]

    IO.inspect("Running against " <> input_file)

    with_mock IO, io_mocks do
      start_supervised(AgentHelper)

      ComboMeal.main()
      assert AgentHelper.assert_captured_io() == output

      stop_supervised(AgentHelper)
    end
  end

  defp testcases() do
    path = "test/testcases/input"

    input_files =
      File.ls!(path)
      |> Enum.map(&Path.join(path, &1))

    output_files =
      input_files
      |> Enum.map(&String.replace(&1, "input", "output"))

    Enum.zip(input_files, output_files)
  end
end
