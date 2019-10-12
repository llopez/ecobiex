defmodule Ecobiex.Endpoint.Info do
  @endpoint "https://apitransporte.buenosaires.gob.ar/ecobici/gbfs/stationInformation"

  alias Ecobiex.Request

  def all(client) do
    @endpoint
    |> Request.build_request(client)
    |> Request.do_request()
    |> Request.parse_response()
  end
end
