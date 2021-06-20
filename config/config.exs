# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :learning_phoenix_liveview_brightness_gauge,
  ecto_repos: [LearningPhoenixLiveviewBrightnessGauge.Repo]

# Configures the endpoint
config :learning_phoenix_liveview_brightness_gauge, LearningPhoenixLiveviewBrightnessGaugeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Fcq1dAr9cmITfiC5mojfiJyK9HVilrCF4wea1BXhWqdd8Tx6kPHJrIj6xTvc5rPz",
  render_errors: [view: LearningPhoenixLiveviewBrightnessGaugeWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LearningPhoenixLiveviewBrightnessGauge.PubSub,
  live_view: [signing_salt: "I2y8mLnN"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
