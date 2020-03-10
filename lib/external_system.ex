defmodule ExternalSystem do

  @system Application.get_env(:webhook_processor, :external_system)
  def call do
    IO.inspect @system
    @system.call_endpoint("arg0", "arg1")
  end
end

defmodule ExternalSystem.Api do
  @callback call_endpoint(arg0 :: String.t(), arg1 :: String.t()) :: {:ok, map()}
end

defmodule ExternalSystem.Http do
  @behaviour ExternalSystem.Api
  def call_endpoint(_arg0, _arg1) do
    url = "some external url"

    HTTPoison.get!(url)
    |> Map.get(:body)
  end
end
