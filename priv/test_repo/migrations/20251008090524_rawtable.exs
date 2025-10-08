defmodule TdsTest.TestRepo.Migrations.Rawtable do
  use Ecto.Migration

  def up do
    execute """
      CREATE TABLE dbo.Rawdata (
        ID UNIQUEIDENTIFIER CONSTRAINT PK_Rawdata PRIMARY KEY NONCLUSTERED,
        FText NTEXT NULL,
        FBin2048 BINARY(2048) NULL,
        FVarBin VARBINARY(MAX) NULL,
        FVarBin500 VARBINARY(500) NULL
        );
    """
  end

  def down do
    execute "DROP TABLE IF EXISTS dbo.Rawdata"
  end
end
