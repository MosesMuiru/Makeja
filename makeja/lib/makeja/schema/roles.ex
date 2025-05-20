defmodule Makeja.Schema.Roles do
  use Ecto.Schema

  schema "roles" do
    field :uuid, Ecto.UUID, autogenerate: true
    field :number, :integer
    field :role_name, :string

    belongs_to :users, Makeja.Schema.Users

    timestamps()
  end
end
