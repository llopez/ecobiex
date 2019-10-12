defmodule Ecobiex.Client do
  defstruct client_id: "", client_secret: ""

  @spec new(String.t(), String.t()) :: {Ecobiex.Client.t()}
  def new(client_id, client_secret) do
    %__MODULE__{client_id: client_id, client_secret: client_secret}
  end
end
