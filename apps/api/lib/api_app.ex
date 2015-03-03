defmodule API.App do
  use Application

  def start(_type, _args) do
    Plug.Adapters.Cowboy.http API.Router, []
  end
  
end
