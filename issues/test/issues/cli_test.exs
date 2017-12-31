defmodule CliTest do
  use ExUnit.Case
  import Issues.Cli, only: [ parse_args: 1 ]

  test "aliases for help" do
    assert parse_args(["-h"]) == :help
    assert parse_args(["--help"]) == :help
  end

  describe "given a count is passed" do
    test "returns correct user, project and count" do
      assert parse_args(["stevie", "wonder", "2"]) == { "stevie", "wonder", 2 }
    end
  end

  describe "given no count is passed" do
    test "returns correct user, project and default count" do
      assert parse_args(["stevie", "wonder"]) == { "stevie", "wonder", 4 }
    end
  end
end
