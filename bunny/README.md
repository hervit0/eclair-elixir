# Bunny

## RabbitMQ AMQP driver

https://github.com/pma/amqp

## Quickly mount a contained RabbitMQ instance

Spark it off (local creds by default `user:bitnami`):
```
$ docker-compose up
```

Source:

https://hub.docker.com/r/bitnami/rabbitmq/

**Docker Compose**
```
$ curl -sSL https://raw.githubusercontent.com/bitnami/bitnami-docker-rabbitmq/master/docker-compose.yml > docker-compose.yml
$ docker-compose up -d
```

## Test the queue

### Normal mode

Assuming docker is running under the hood, in a terminal:
```
mix run lib/receive.exs
```

In another one:
```
mix run lib/receive.exs
```

### Complex mode

On one side: `mix run lib/complex_receive.exs`

On the otherside:
```
mix run lib/complex_send.exs First message.
mix run lib/complex_send.exs Second message..
mix run lib/complex_send.exs Third message...
mix run lib/complex_send.exs Fourth message....
mix run lib/complex_send.exs Fifth message.....
```

### With an `fanout` exhange protocol

```
mix run lib/fanout_receive.exs > alice.log
mix run lib/fanout_send.exs
```

### With an `direct` exhange protocol

```
mix run lib/direct_receive.exs --info --warning --error
mix run lib/direct_send.exs --error "Boom"
```

### With an `topic` exhange protocol

```
mix run lib/topic_receive.exs "#"
mix run lib/topic_send.exs "kern.critical"
```
