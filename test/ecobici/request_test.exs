defmodule Ecobiex.RequestTest do
  use ExUnit.Case

  setup do
    client = Ecobiex.Client.new("CLIENTID", "CLIENTSECRET")
    %{client: client}
  end

  test "builds url from endpoint and client", %{client: client} do
    assert Ecobiex.Request.build_request("http://example.com", client) ==
             'http://example.com?client_id=CLIENTID&client_secret=CLIENTSECRET'
  end
end
