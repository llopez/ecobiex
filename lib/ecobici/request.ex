defmodule Ecobiex.Request do
  def build_request(endpoint, client) do
    endpoint
    |> URI.parse()
    |> add_query_params(client)
    |> URI.to_string()
    |> to_charlist
  end

  def do_request(request) do
    {:ok, {{'HTTP/1.1', 200, 'OK'}, _, body}} = :httpc.request(:get, {request, []}, [], [])
    body
  end

  def parse_response(response) do
    Poison.decode!(response)
  end

  defp add_query_params(uri, client) do
    uri
    |> Map.put(:query, build_query_string(client))
  end

  defp build_query_string(client) do
    Map.from_struct(client)
    |> URI.encode_query()
  end
end
