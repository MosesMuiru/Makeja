defmodule Makeja.Repo.Migrations.AlterUserTableAddPhoneNumberVerified do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :phone_number_verified, :boolean
      add :time_verified, :utc_datetime
    end
  end
end
