defmodule Queuetopia.MixProject do
  use Mix.Project

  def project do
    [
      app: :queuetopia,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      package: package(),
      description: description(),
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),
      aliases: aliases()
    ]
  end

  defp package() do
    [
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/annatel/queuetopia"}
    ]
  end

  defp description() do
    "the blocking job queue"
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ecto_sql, "~> 3.4"},
      {:myxql, "~> 0.4.0", only: :test},
      {:jason, "~> 1.0"},
      {:antl_utils, git: "git@github.com:annatel/antl_utils.git", tag: "0.3.0"},
      {:datetime_utils, git: "git@gitlab.annatel.net:mvno/datetime_utils.git", tag: "0.3.0"},
      {:ex_machina, "~> 2.4", only: :test},
      {:mox, "~> 0.5", only: :test}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp aliases do
    [
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end