defmodule CliTest do
  use ExUnit.Case
  import Issues.Cli, only: [
    parse_args: 1,
    to_hash_dict: 1,
    order: 1
  ]

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

  test "sorts the issues by 'created_at'" do
    issues = factory_issues_list(["c", "a", "b"]) |> order
    created_at_fields = for issue <- issues, do: issue["created_at"]
    assert created_at_fields == ~w{a b c}
  end

  defp factory_issues_list(created_at_fields) do
    issues = for created_at <- created_at_fields, do: [{"created_at", created_at}]
    issues |> to_hash_dict
  end
end
