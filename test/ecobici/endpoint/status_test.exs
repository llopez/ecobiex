defmodule Ecobici.Endpoint.StatusTest do
  use ExUnit.Case

  import Mock

  setup do
    body = """
      {
        "data": {
          "stations": [
            {
              "is_charging_station": false,
              "is_installed": 1,
              "is_renting": 1,
              "is_returning": 1,
              "last_reported": 1570916212,
              "num_bikes_available": 0,
              "num_bikes_available_types": {
                "ebike": 0,
                "mechanical": 0
              },
              "num_bikes_disabled": 0,
              "num_docks_available": 20,
              "num_docks_disabled": 0,
              "station_id": "39",
              "status": "IN_SERVICE"
            }
          ]
        }
      }
    """

    client = Ecobici.Client.new("id", "secret")
    %{client: client, body: body}
  end

  test "retrieves dynamic status about for stations", %{client: client, body: body} do
    with_mock :httpc,
      request: fn :get, {_, []}, [], [] ->
        {:ok, {{'HTTP/1.1', 200, 'OK'}, [], body}}
      end do
      assert Ecobici.Endpoint.Status.all(client) == %{
               "data" => %{
                 "stations" => [
                   %{
                     "is_charging_station" => false,
                     "is_installed" => 1,
                     "is_renting" => 1,
                     "is_returning" => 1,
                     "last_reported" => 1_570_916_212,
                     "num_bikes_available" => 0,
                     "num_bikes_available_types" => %{"ebike" => 0, "mechanical" => 0},
                     "num_bikes_disabled" => 0,
                     "num_docks_available" => 20,
                     "num_docks_disabled" => 0,
                     "station_id" => "39",
                     "status" => "IN_SERVICE"
                   }
                 ]
               }
             }
    end
  end
end
