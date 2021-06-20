use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :learning_phoenix_liveview_brightness_gauge, LearningPhoenixLiveviewBrightnessGauge.Repo,
  username: "postgres",
  password: "postgres",
  database: "learning_phoenix_liveview_brightness_gauge_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :learning_phoenix_liveview_brightness_gauge, LearningPhoenixLiveviewBrightnessGaugeWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
