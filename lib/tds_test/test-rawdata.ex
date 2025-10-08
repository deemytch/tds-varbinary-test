defmodule TdsTest.Rawdata do
  use Ecto.Schema

	@primary_key {:ID, Ecto.UUID, autogenerate: false}
	@schema_prefix "dbo"

	schema "Rawdata" do
		field :FText
		field :FBin2048, :binary
		field :FVarBin, :binary
		field :FVarBin500, :binary
  end
end
