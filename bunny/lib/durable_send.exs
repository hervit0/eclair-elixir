message =
  case System.argv() do
    [] -> "Hello World!"
    words -> Enum.join(words, " ")
  end

{:ok, connection} = AMQP.Connection.open(username: "user", password: "bitnami")
{:ok, channel} = AMQP.Channel.open(connection)

routing_key = "my.awesome.durable.event"
AMQP.Queue.declare(channel, routing_key, durable: true)
AMQP.Basic.publish(channel, "", routing_key, message, persistent: true)

IO.puts(" [x] Send '#{message}'")
