defmodule EndpointTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts WebhookProcessor.Endpoint.init([])

  describe "when calling /ping" do
    test "it returns pong" do
      conn = conn(:get, "/ping")

      conn = WebhookProcessor.Endpoint.call(conn, @opts)

      assert conn.state == :sent
      assert conn.status == 200
      assert conn.resp_body == "pong!"
    end
  end

  describe "when calling /events" do
    test "it returns status 200 if called correctly" do
      body = %{events: [%{}]}
      conn = conn(:post, "/events", body)

      conn = WebhookProcessor.Endpoint.call(conn, @opts)

      assert conn.status == 200
    end

    test "it returns status 422 if called wrongly" do
      wrong_body = %{}
      conn = conn(:post, "/events", wrong_body)

      conn = WebhookProcessor.Endpoint.call(conn, @opts)

      assert conn.status == 422
    end
  end

  describe "when calling an unmatched route" do
    test "it returns 404" do
      conn = conn(:get, "/unmatched")

      conn = WebhookProcessor.Endpoint.call(conn, @opts)

      assert conn.status == 404
    end
  end
end
