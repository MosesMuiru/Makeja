defmodule Makeja.Repo.Migrations.CreateRole do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :uuid, :uuid, null: false
      add :number, :integer
      add :role_rep, :string

      timestamps()
    end
  end
end
