defmodule Kmitr.Mixfile do
  use Mix.Project

  def project do
    [apps_path: "apps",
     deps: deps]
  end

  defp deps do
    [
      {:exrm, "~> 0.14.16"}
    ]
  end
end
