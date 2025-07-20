defmodule Makeja.Schema.Attachments do
  use Ecto.Schema
  import Ecto.Changeset

  schema "attachments" do
    field :uuid, Ecto.UUID, autogenerate: true
    field :url, :string

    belongs_to :house, Makeja.Schema.House
    #    belongs_to :reviews, Makeja.Schema.Reviews

    timestamps()
  end

  def changeset(attachments, params \\ %{}) do
    attachments
    |> cast(params, [:url])
    |> validate_required([:url])
  end
end
