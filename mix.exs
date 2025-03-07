defmodule HitPay.MixProject do
  use Mix.Project

  def project do
    [
      app: :hit_pay,
      version: "0.2.5",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package()
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
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:jason, "~> 1.4"},
      {:httpoison, "~> 2.1.0"},
      {:plug_crypto, "~> 1.2"},
      {:ex_doc, "~> 0.30.6", only: :dev}
    ]
  end

  defp description do
    """
    A HitPay client for Elixir.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Zek Chak"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/ziazek/hit_pay"}
    ]
  end
end
