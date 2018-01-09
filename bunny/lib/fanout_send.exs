message =
  case System.argv() do
    [] -> "Hello World!"
    words -> Enum.join(words, " ")
  end

{:ok, connection} = AMQP.Connection.open(username: "user", password: "bitnami")
{:ok, channel} = AMQP.Channel.open(connection)

exchange = "logs"
AMQP.Exchange.declare(channel, exchange, :fanout)

# Rounting key is an empty string on purpose
routing_key = ""
# AMQP.Queue.declare(channel, routing_key, durable: true)
AMQP.Basic.publish(channel, exchange, routing_key, message)

IO.puts(" [x] Send '#{message}'")

AMQP.Connection.close(connection)
