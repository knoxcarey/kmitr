defmodule Device.API.Mixfile do
  use Mix.Project

  def project do
    [app: :device,
     version: "0.0.1",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.0",
     deps: deps]
  end

  def application do
    [applications: [:logger],
     mod: {Device.App, []}]
  end

  defp deps do
    [
      {:exactor,   "~> 2.0.1"}
    ]
  end
end
