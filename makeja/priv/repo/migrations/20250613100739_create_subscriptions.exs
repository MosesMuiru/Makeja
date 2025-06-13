defmodule Makeja.Repo.Migrations.CreateSubscriptions do
  use Ecto.Migration

  def change do
    create table(:subcriptions) do
      add :uuid, :uuid, null: false
      add :amount, :integer
      add :status, :string
      add :is_active, :boolean
      add :start_date, :utc_datetime
      add :end_date, :utc_datetime

      timestamps()
    end
  end
end
