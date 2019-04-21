use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hubtel_ussd_phoenix_example, HubtelUssdPhoenixExampleWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :hubtel_ussd_phoenix_example, HubtelUssdPhoenixExample.Repo,
  username: "postgres",
  password: "postgres",
  database: "hubtel_ussd_phoenix_example_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
