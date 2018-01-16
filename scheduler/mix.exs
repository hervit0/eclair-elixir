defmodule Scheduler.MixProject do
  use Mix.Project

  def project do
    [
      app: :scheduler,
      version: "0.1.0",
      elixir: "~> 1.6-rc",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Scheduler.Application, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:quantum, ">= 2.2.1"},
      {:timex, "~> 3.0"},
      {:gettext, "~> 0.14.0"},
      {:mock, "~> 0.3.0", only: :test}
    ]
  end
end
