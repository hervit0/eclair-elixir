defmodule Receive do
  def wait_for_messages do
    receive do
      {:basic_deliver, payload, _meta} ->
        IO.puts(" [x] Received #{payload}")
        wait_for_messages
    end
  end
end

{:ok, connection} = AMQP.Connection.open([username: "user", password: "bitnami"])
{:ok, channel} = AMQP.Channel.open(connection)

routing_key = "my.awesome.event"
AMQP.Queue.declare(channel, routing_key)
AMQP.Basic.consume(channel, routing_key, nil, no_ack: true)

IO.puts(" [*] Waiting for messages. To exit press CTRL+C, CTRL+C")

Receive.wait_for_messages()
