use Mix.Config

config :webhook_processor, port: 4001
config :webhook_processor, :external_system, ExternalSystem.Http
