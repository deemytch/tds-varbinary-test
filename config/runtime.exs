import Config

IO.puts "Trying to load runtime config for #{config_env()} environment."
# fuck the limitations

config_file = [
    System.fetch_env("RUNTIME_CFG_DIR"),
    Application.app_dir(:tds_test, "config/env"),
    "#{ File.cwd! }/config/env"
  ] |> Enum.find_value(fn
      pa when is_binary(pa) ->
        filename = "#{pa}/#{config_env()}.exs"
        File.exists?(filename) && filename
      _ -> false
      end)

config_file && Code.require_file(config_file)
