defmodule Makeja.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :uuid, :uuid, null: false
      add :username, :string
      add :phone_number, :string
      add :email, :string
      add :confirmed, :boolean
      add :password_hash, :string
      add :role, :string

      # making sure that the email is unique
      timestamps()
    end

    create unique_index(:users, [:email, :phone_number])
  end
end
