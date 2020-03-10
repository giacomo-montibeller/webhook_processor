use Mix.Config

config :webhook_processor, port: 4002
config :webhook_processor, :external_system, ExternalSystem.Mock
config :logger, level: :error
