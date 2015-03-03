defmodule Device.App do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [worker(Device, [])]
    opts = [strategy: :one_for_one, name: Device.Supervisor]

    Supervisor.start_link(children, opts)
  end
end
