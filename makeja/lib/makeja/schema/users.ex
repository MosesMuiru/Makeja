defmodule Makeja.Schema.Users do
  use Ecto.Schema
  # alias Makeja.Schema.Roles

  import Ecto.Changeset

  schema "users" do
    field :uuid, Ecto.UUID, autogenerate: true
    field :username, :string
    field :phone_number, :string
    field :email, :string
    field :password_hash, :string
    field :confirmed, :boolean, default: false
    field :role, Ecto.Enum, values: [:landlord, :agent, :admin, :user]
    field :phone_number_verified, :boolean, default: false
    field :time_verified, :utc_datetime

    has_one :subscriptions, Makeja.Subscription
    has_many :reviews, Makeja.Schema.Reviews
    has_many :houses, Makeja.Schema.Users
    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:username, :phone_number, :password_hash])
    |> validate_required([:username, :phone_number, :password_hash])
    |> validate_format(:email, ~r/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/)
    |> unique_constraint([:email, :phone_number])
  end
end
