{:ok, connection} = AMQP.Connection.open([username: "user", password: "bitnami"])
{:ok, channel} = AMQP.Channel.open(connection)

routing_key = "my.awesome.event"
payload = :rand.uniform(1000) |> Integer.to_string
AMQP.Queue.declare(channel, routing_key)
AMQP.Basic.publish(channel, "", routing_key, payload)

IO.puts(" [x] Sent " <> payload)
AMQP.Connection.close(connection)
