defmodule TdsTest.TestRepo do
  use Ecto.Repo,
    otp_app: :tds_test,
    adapter: Ecto.Adapters.Tds
end
