defmodule WebhookProcessor.Cowboy do

  def child_spec(_) do
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
  end
end
