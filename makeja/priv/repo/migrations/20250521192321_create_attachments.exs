defmodule Makeja.Repo.Migrations.CreateAttachments do
  use Ecto.Migration

  def change do
    create table("attachments") do
      add :uuid, :uuid, null: false
      add :url, :string

      timestamps()
    end
  end
end
