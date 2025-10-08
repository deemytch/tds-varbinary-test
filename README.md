# TdsTest

Edit `config/env/*.exs` replacing `INVALID PASSWORD` and server address
  mix do deps.get, compile, ecto.migrate
  mix test
