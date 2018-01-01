defmodule Issues.Cli do
  @default_count 4
  def run argv do
    argv
      |> parse_args
      |> process
  end

  def parse_args argv do
    parse = OptionParser.parse(argv, switches: [help: :boolean], aliases: [h: :help])

    case parse do
      { [ help: true ], _, _ } -> :help
      { _, [user, project, count], _ } -> { user, project, String.to_integer(count) }
      { _, [user, project], _ } -> { user, project, @default_count}
      _ -> :help
    end
  end

  def process :help do
    IO.puts "Try harder mate!"
    System.halt(0)
  end

  def process {user, project, _count} do
    Issues.GithubIssues.fetch(user, project)
      |> decode_response
      |> to_hash_dict
      |> order
  end

  def decode_response({:ok, body}), do: body

  def decode_response({:error, error}) do
    {_, message} = List.keyfind(error, "message", 0)
    IO.puts "Hey dude, sorry, but I gat this for ya: #{message}"
    System.halt(2)
  end

  def to_hash_dict(issues), do: issues |> Enum.map(&Enum.into(&1, HashDict.new))

  def order(issues) do
    Enum.sort issues,
      fn issue1, issue2 -> issue1["created_at"] <= issue2["created_at"] end
  end
end
