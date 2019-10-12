defmodule Ecobici.Endpoint.InfoTest do
  use ExUnit.Case

  import Mock

  setup do
    body = """
      {
        "data": {
          "stations": [
            {
              "address": "Ramos Mejia, Jose Maria, Dr. Av. & Del Libertador Av.",
              "altitude": 0.0,
              "capacity": 20,
              "groups": ["RETIRO"],
              "lat": -34.5924233,
              "lon": -58.3747151,
              "name": "002 - Retiro I",
              "obcn": "",
              "physical_configuration": "SMARTLITMAPFRAME",
              "post_code": "11111",
              "rental_methods": ["KEY", "TRANSITCARD", "PHONE"],
              "station_id": "2"
            }
          ]
        }
      }
    """

    client = Ecobici.Client.new("id", "secret")
    %{client: client, body: body}
  end

  test "retrieves static info about all stations", %{client: client, body: body} do
    with_mock :httpc,
      request: fn :get, {_, []}, [], [] ->
        {:ok, {{'HTTP/1.1', 200, 'OK'}, [], body}}
      end do
      assert Ecobici.Endpoint.Info.all(client) == %{
               "data" => %{
                 "stations" => [
                   %{
                     "address" => "Ramos Mejia, Jose Maria, Dr. Av. & Del Libertador Av.",
                     "altitude" => 0.0,
                     "capacity" => 20,
                     "groups" => ["RETIRO"],
                     "lat" => -34.5924233,
                     "lon" => -58.3747151,
                     "name" => "002 - Retiro I",
                     "obcn" => "",
                     "physical_configuration" => "SMARTLITMAPFRAME",
                     "post_code" => "11111",
                     "rental_methods" => ["KEY", "TRANSITCARD", "PHONE"],
                     "station_id" => "2"
                   }
                 ]
               }
             }
    end
  end
end
