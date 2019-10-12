defmodule Ecobiex.Endpoint.Status do
  @endpoint "https://apitransporte.buenosaires.gob.ar/ecobici/gbfs/stationStatus"

  alias Ecobiex.Request

  def all(client) do
    @endpoint
    |> Request.build_request(client)
    |> Request.do_request()
    |> Request.parse_response()
  end
end
