defmodule TdsTest.Application do
  @moduledoc false
  use Application

  @impl true
  def start(_type, _args) do
    children = [TdsTest.TestRepo]

    opts = [strategy: :one_for_one, name: TdsTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
