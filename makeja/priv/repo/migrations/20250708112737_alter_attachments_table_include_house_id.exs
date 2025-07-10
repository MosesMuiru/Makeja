defmodule Makeja.Repo.Migrations.AlterAttachmentsTableIncludeHouseId do
  use Ecto.Migration

  def change do
    alter table(:attachments) do
      add :house_id, references(:houses, on_delete: :delete_all)
    end
  end
end
