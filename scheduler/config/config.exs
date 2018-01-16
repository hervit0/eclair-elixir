use Mix.Config

config :scheduler, Scheduler.Scheduler,
  global: true,
  jobs: [
    # Every minute
    {"* * * * *", {Scheduler.Foo, :hit_frequently, []}},
    # Every day at 4:13pm
    {"13 16 * * *", {Scheduler.Foo, :hit_once, []}}
  ]
