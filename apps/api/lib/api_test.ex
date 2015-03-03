defmodule API.Test do
  use Plug.Router

  plug :match
  plug :dispatch

  match _ do
    send_resp(conn, 200, "You asked for #{full_path(conn)}")
  end

end