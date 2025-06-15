defmodule Makeja.Repo.Migrations.AlterUserTableToAddConstraints do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add_if_not_exists :username, :string
      add_if_not_exists :phone_number, :string
      add_if_not_exists :email, :string
    end

    create unique_index(:users, [:username, :phone_number, :email])
  end
end
