defmodule Ecobici.Endpoint.Status do
  @endpoint "https://apitransporte.buenosaires.gob.ar/ecobici/gbfs/stationStatus"

  alias Ecobici.Request

  def all(client) do
    @endpoint
    |> Request.build_request(client)
    |> Request.do_request()
    |> Request.parse_response()
  end
end
