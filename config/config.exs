# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :benanachain_registry,
  ecto_repos: [BenanachainRegistry.Repo]

# Configures the endpoint
config :benanachain_registry, BenanachainRegistry.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xsfZZESOdv/Z60IoEsjaua1GbJMp2Gb2C9yV8dWzs476pS7qDNfXg3RPBNfv0PYM",
  render_errors: [view: BenanachainRegistry.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BenanachainRegistry.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
