defmodule RestEx.MixProject do
  use Mix.Project

  @source_url "https://github.com/ByeongUkChoi/rest_ex"
  @version "0.0.0"

  def project do
    [
      app: :rest_ex,
      version: @version,
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Hex
      description: "Elixir REST API generator",
      package: package(),

      # Docs
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto, "~> 3.8"},
      {:plug_cowboy, "~> 2.5"},
      {:ex_doc, "~> 0.28", only: :docs}
    ]
  end

  defp package() do
    [
      files: ~w(lib .formatter.exs mix.exs README* LICENSE*),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs do
    [
      main: "readme",
      source_ref: "v#{@version}",
      source_url: @source_url,
      extras: ["README.md"],
      skip_undefined_reference_warnings_on: ["CHANGELOG.md"]
    ]
  end
end
