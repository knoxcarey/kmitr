defmodule API.Router do
  use Plug.Router

  # Dispatching to more specific routers
  forward "/device", to: API.Device
  forward "/test",   to: API.Test

  # Pipeline for handling other requests
  plug :match
  plug :dispatch

  # Response if nothing else matches
  match _, do: send_resp(conn, :not_found, "Not found.")

end
