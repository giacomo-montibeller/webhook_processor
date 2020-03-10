defmodule ExternalSystemTest do
  use ExUnit.Case, async: true
  import Mox

  Mox.defmock(ExternalSystem.Mock, for: ExternalSystem.Api)

  setup :verify_on_exit!

  test "call/0 calls the external service" do
    expect(ExternalSystem.Mock, :call_endpoint, fn a, b -> (
    IO.inspect (a <> b)
    "some value" )end)

    assert ExternalSystem.call() == "some value"
  end
end
