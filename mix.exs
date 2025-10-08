defmodule TdsTest.MixProject do
  use Mix.Project

  def project do [
      app: :tds_test,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
  ] end

  def application do
    extrapp = case Mix.env() do
      :prod -> [:logger, :observer, :runtime_tools]
      :test -> [:logger]
      _ -> [:logger, :eex, :wx, :observer, :runtime_tools]
    end
    [extra_applications: extrapp, mod: {TdsTest.Application, []}]
  end

  defp deps do [
      {:ecto_sql, "~> 3.13"},
      tds: "~> 2.3",
      uuid: "~> 1.1"
  ] end
end
