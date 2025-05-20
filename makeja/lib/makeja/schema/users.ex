defmodule Makeja.Schema.Users do
  use Ecto.Schema
  alias Makeja.Schema.Roles
  alias Makeja.Schema.House

  schema "users" do
    field :uuid, Ecto.UUID, autogenerate: true
    field :first_name, :string
    field :last_name, :string
    field :phone_number, :string
    field :email, :string
    field :password_hash, :string
    field :confirmed, :boolean, default: false

    belongs_to :roles, Roles
    has_many :houses, House

    timestamps()
  end
end

