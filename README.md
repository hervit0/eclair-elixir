# unrust-elixir
Learning Elixir!

## So far...
```
elixir hello.exs
elixir c5.exs
elixir c6.exs
elixir c7.exs
elixir c10.exs
```

## Issues Github thing
Have to be run at the root of `issues`:

```
mix run -e 'Issues.Cli.run(["-h"])'
mix test
mix escript.build
```

Open a console:
```
iex -S mix
```

### Naive dichotomy
```
elixir dicho.exs
```

## Hu?
```
iex(3)> i "hello"
Term
  "hello"
Data type
  BitString
Byte size
  5
Description
  This is a string: a UTF-8 encoded binary. It's printed surrounded by
  "double quotes" because all UTF-8 encoded codepoints in it are printable.
Raw representation
  <<104, 101, 108, 108, 111>>
Reference modules
  String, :binary
Implemented protocols
  IEx.Info, Inspect, String.Chars, List.Chars, Collectable
```

```
iex(2)> i 'hello'
Term
  'hello'
Data type
  List
Description
  This is a list of integers that is printed as a sequence of characters
  delimited by single quotes because all the integers in it represent valid
  ASCII characters. Conventionally, such lists of integers are referred to as
  "charlists" (more precisely, a charlist is a list of Unicode codepoints,
  and ASCII is a subset of Unicode).
Raw representation
  [104, 101, 108, 108, 111]
Reference modules
  List
Implemented protocols
  IEx.Info, Inspect, String.Chars, List.Chars, Collectable, Enumerable
```
