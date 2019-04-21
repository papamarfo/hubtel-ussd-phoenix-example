# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hubtel_ussd_phoenix_example,
  ecto_repos: [HubtelUssdPhoenixExample.Repo]

# Configures the endpoint
config :hubtel_ussd_phoenix_example, HubtelUssdPhoenixExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zFAGYlRy/nXRd3t5Ed4MlXZFsupWrN/DpUm/RKS4/VvQxWWWiN3jrci7OiVwHELn",
  render_errors: [view: HubtelUssdPhoenixExampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HubtelUssdPhoenixExample.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
