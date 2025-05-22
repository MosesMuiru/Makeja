defmodule Makeja.Repo.Migrations.AlterHouseTableToAddStatus do
  use Ecto.Migration

  def change do
    alter table(:houses) do
      add :status, :string
    end
  end
end
