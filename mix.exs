defmodule HelloWorld.MixProject do
  use Mix.Project

  def project do
    [
      app: :hello_world,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: [main_module: HelloWorld.CLI]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Learn.Elixir.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:gen_stage, "~> 1.0.0"},
      {:earmark, "~> 1.2", only: :dev},
      {:ex_doc, "~> 0.19", only: :dev},
      {:benchee, "~> 1.0", only: :test},
      # {:kafka_ex, "~> 0.11"},
      {:snappy, git: "https://github.com/fdmanana/snappy-erlang-nif"},
      {:snappyer, "~> 1.2"},
      {:telemetry, "~> 1.0"},
      {:patch, "~> 0.13.0", only: [:test]},
      {:ex_hash_ring, "~> 6.0"}
    ]
  end
end
