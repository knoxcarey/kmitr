defmodule Plug.Parsers.MSGPACK do
  @moduledoc """
  Parses a MessagePack request body using Msgpax.
  """

  @behaviour Plug.Parsers
  import Plug.Conn

  def parse(conn, "application", "msgpack", _headers, opts) do
    conn
    |> read_body(opts)
    |> decode
  end

  def parse(conn, _type, _subtype, _headers, _opts) do
    {:next, conn}
  end

  defp decode({:more, _, conn}) do
    {:error, :too_large, conn}
  end

  defp decode({:ok, "", conn}) do
    {:ok, nil, conn}
  end

  defp decode({:ok, body, conn}) do
    case Msgpax.unpack(body) do
      {:ok, terms} ->
        {:ok, terms, conn}
    end
  rescue
    e -> raise Plug.Parsers.ParseError, exception: e
  end
end