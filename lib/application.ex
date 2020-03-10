defmodule WebhookProcessor.Application do
  use Application

  def start(_type, _args) do
    children = [WebhookProcessor.Cowboy]
    opts = [strategy: :one_for_one, name: WebhookProcessor.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
