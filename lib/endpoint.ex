defmodule WebhookProcessor.Endpoint do
  use Plug.Router

  plug Plug.Logger
  plug :match
  plug(Plug.Parsers, parsers: [:json], json_decoder: Poison)
  plug :dispatch

  get "/ping" do
    send_resp(conn, 200, "pong!")
  end
end
