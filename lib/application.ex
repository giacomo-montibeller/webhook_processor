defmodule WebhookProcessor.Application do
  use Application

  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(
        scheme: :https,
        plug: WebhookProcessor.Endpoint,
        options: [
          port: Application.get_env(:webhook_processor, :port),
          keyfile: "priv/keys/local.key",
          certfile: "priv/keys/local.cert",
          otp_app: :webhook_processor
        ]
      )
    ]

    opts = [strategy: :one_for_one, name: WebhookProcessor.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
