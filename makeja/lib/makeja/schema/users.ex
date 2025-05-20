defmodule Makeja.Schema.Users do
  use Ecto.Schema
  alias Makeja.Schema.Roles
  alias Makeja.Schema.House

  import Ecto.Changeset

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


  def changeset(user, params \\ %{}) do

    user
    |> cast(params, [:first_name, :last_name, :phone_number, :password_hash])
    |> validate_required([:first_name, :last_name, :phone_number, :password_hash])
    |> validate_format(:email, ~r/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/)
    |> unique_constraint(:email)
  end

end

