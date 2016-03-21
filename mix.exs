defmodule EQuip.Mixfile do
  use Mix.Project

  def project do
    [app: :e_quip,
     version: "0.0.1",
     elixir: "~> 1.2",
     description: description,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package,
     deps: deps]
  end

  def application do
    [applications: [:logger, :httpoison]]
  end

  defp deps do
    [{:httpoison, "~> 0.8.0"}, {:poison, "~> 2.0"}]
  end

  defp description do
    "Simple Quip API Client"
  end

  defp package do
    [# These are the default files included in the package
      files: ["lib", "mix.exs", "README*", "LICENSE*", "license*"],
      maintainers: ["Mike Martinson"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/mmartinson/e_quip"}
    ]
  end
end
