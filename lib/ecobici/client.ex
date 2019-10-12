defmodule Ecobiex.Client do
  defstruct client_id: "", client_secret: ""

  def new(client_id, client_secret) do
    %__MODULE__{client_id: client_id, client_secret: client_secret}
  end
end
