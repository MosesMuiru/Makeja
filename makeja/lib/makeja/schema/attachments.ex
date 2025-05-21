defmodule Makeja.Schema.Attachments do
  use Ecto.Schema

  schema "attachments" do
    field :uuid, Ecto.UUID, autogenerate: true
    field :url, :string

    belongs_to :house, Makeja.Schema.House
    belongs_to :reviews, Makeja.Schema.Reviews

    timestamps()
  end
end
