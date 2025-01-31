defmodule Elastix.Mixfile do
  use Mix.Project

  @source_url "https://github.com/UrbanOS-Public/elastix_search"
  @version "1.0.1"

  def project do
    [
      app: :elastix_search,
      name: "Elastix Search",
      version: @version,
      elixir: "~> 1.14",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      package: package(),
      deps: deps(),
      docs: docs()
    ]
  end

  def application do
    [
      applications: [:logger, :httpoison, :retry]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.29", only: :dev, runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test]},
      {:mix_test_watch, "~> 1.1", only: [:test, :dev]},
      {:poison, "~> 5.0", optional: true},
      {:httpoison, "~> 2.1"},
      {:retry, "~> 0.15"}
    ]
  end

  defp package do
    [
      description: "A DSL-free Elastic / Elasticsearch client for Elixir.",
      files: ["lib", "mix.exs", "README.md", "CHANGELOG.md", "LICENSE"],
      maintainers: ["UrbanOS"],
      licenses: ["WTFPL-2"],
      links: %{
        "Changelog" => "https://hexdocs.pm/elastix_search/changelog.html",
        "GitHub" => @source_url
      }
    ]
  end

  defp aliases do
    [compile: ["compile --warnings-as-errors"]]
  end

  defp docs do
    [
      extras: [
        "CHANGELOG.md",
        {:LICENSE, [title: "License"]},
        "README.md",
        "pages/custom-json-codec.md"
      ],
      main: "readme",
      source_url: @source_url,
      source_ref: "v#{@version}",
      formatters: ["html"]
    ]
  end
end
