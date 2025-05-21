defmodule Makeja.Repo.Migrations.CreateReviews do
  use Ecto.Migration

  def change do
    create table("reviews") do
      add :uuid, :uuid, null: false
      add :comment, :string

      add :user_id, references(:users, on_delete: :delete_all)
      add :attachment_id, references(:attachments, on_delete: :delete_all)
      timestamps()
    end
  end
end
