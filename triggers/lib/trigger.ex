defmodule Trigger do
  def get do
    csv_filepath = Path.expand(__DIR__ <> "/locations.csv")

    csv_filepath
    |> File.stream!()
    |> CSV.decode(headers: true)
    |> Enum.each(&IO.inspect/1)
  end
end

Trigger.get()
