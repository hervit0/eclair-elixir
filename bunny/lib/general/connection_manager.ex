defmodule ConnectionManager do
  def sesam() do
    {:ok, connection} = AMQP.Connection.open(username: "user", password: "bitnami")
    {:ok, channel} = AMQP.Channel.open(connection)
    %{connection: connection, channel: channel}
  end
end
