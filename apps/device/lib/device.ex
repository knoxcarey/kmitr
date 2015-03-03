defmodule Device do
  use ExActor.GenServer, export: Device
  require Record

  #=======================================================================
  # CONSTANTS
  #=======================================================================

  # Temporarily store user data in ETS
  @table :devices


  #=======================================================================
  # RECORDS
  #=======================================================================

  # Temporary -- will eventually store in a database
  Record.defrecord :device, id: nil, pubkey: nil


  #=======================================================================
  # GENSERVER INTERFACE
  #=======================================================================

  @doc "Start the device service."
  defstart start_link do 
    table = :ets.new(@table, [:set, :protected, {:keypos, 2}])
    initial_state table
  end

  @doc "Create a new device with the given id and public key."
  defcall new(id, pub), state: table do
    dev = device(id: id, pubkey: pub)
    reply :ets.insert_new(table, dev)
  end

  @doc "Fetch a device public key"
  defcall public_key(id), state: table do
    lookup(table, id) |> extract_pubkey |> reply
  end


  #=======================================================================
  # INTERNAL FUNCTIONS
  #=======================================================================

  # Fetch a device record
  defp lookup(table, key) do
    case :ets.lookup(table, key) do
      []  -> nil
      [x] -> x
    end
  end

  # Extract public key from device record
  defp extract_pubkey(nil), do: nil
  defp extract_pubkey(dev), do: device(dev, :pubkey)

end