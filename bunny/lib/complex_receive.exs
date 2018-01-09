defmodule Worker do
  def wait_for_messages(channel) do
    receive do
      {:basic_deliver, payload, meta} ->
        IO.puts(" [x] Received #{payload}")

        payload
        |> to_char_list
        |> Enum.count(fn x -> x == ?. end)
        |> Kernel.*(1000)
        |> :timer.sleep()

        IO.puts(" [x] Done.")
        AMQP.Basic.ack(channel, meta.delivery_tag)

        wait_for_messages(channel)
    end
  end
end

{:ok, connection} = AMQP.Connection.open(username: "user", password: "bitnami")
{:ok, channel} = AMQP.Channel.open(connection)

routing_key = "my.awesome.event"
AMQP.Queue.declare(channel, routing_key)
AMQP.Basic.consume(channel, routing_key)
# AMQP.Basic.consume(channel, routing_key, no_ack: true)

IO.puts(" [*] Waiting for messages. To exit press CTRL+C, CTRL+C")

Worker.wait_for_messages(channel)
