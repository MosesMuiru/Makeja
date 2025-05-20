defmodule Makeja.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :phone_number, :string
      add :email, :string
      add :confirmed, :boolean
      add :password_hash, :string

      add :role, references(:role, on_delete: :delete_all)
      timestamps()
    end

  end
end
