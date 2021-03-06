defmodule API.App.Mixfile do
  use Mix.Project

  def project do
    [app: :api,
     version: "0.0.1",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.0",
     deps: deps]
  end

  def application do
    [
      applications: [:logger, :cowboy, :plug], 
      mod: {API.App, []}]
  end

  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug,   "~> 0.11.0"},
      {:msgpax, "~> 0.6"}
    ]
  end
end
