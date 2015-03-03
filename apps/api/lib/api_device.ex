defmodule API.Device do
  use Plug.Router

  #=======================================================================
  # PLUGS
  #=======================================================================

  plug Plug.Parsers, parsers: [:msgpack]
  plug :match
  plug :dispatch


  #=======================================================================
  # ROUTES
  #=======================================================================

  # Create a new device
  put "/:id" do
    pubkey = conn.params["pubkey"]
    Device.new(id, pubkey)
    send_resp(conn, :ok, "Created device #{id} with key #{pubkey}")
  end

  # Get a device public key
  get "/:id/public" do
    pub = Device.public_key(id)
    send_resp(conn, :ok, pub)
  end

end