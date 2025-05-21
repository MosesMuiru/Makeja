defmodule Makeja.Repo.Migrations.CreateHouses do
  use Ecto.Migration

  def change do
    create table("houses") do
      add :uuid, :uuid, null: false
      add :house_name, :string
      add :description, :string
      add :price, :string
      add :property_type, :string
      add :bedrooms, :integer
      add :bathrooms, :integer
      add :square_feet, :integer
      add :address, :string
      add :city, :string
      add :county, :string
      add :country, :string
      add :latitude, :string
      add :longitude, :string

      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end
  end
end
