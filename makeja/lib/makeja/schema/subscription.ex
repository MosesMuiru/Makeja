defmodule Makeja.Subscription do
  alias Makeja.Users.Users
  use Ecto.Schema
  import Ecto.Changeset

  schema "subscriptions" do
    field :uuid, Ecto.UUID, autogenerate: true
    field :amount, :integer
    field :status, :string
    field :is_active, :boolean, default: true
    field :start_date, :utc_datetime
    field :end_date, :utc_datetime

    field :period, :string, default: "weekly"

    belongs_to :user, Users
    timestamps()
  end

  def changeset(sub, attrs) do
    sub
    |> cast(attrs, [:amount, :status, :start_date, :end_date])
    |> validate_required([:user_id, :amount, :status])
  end
end
