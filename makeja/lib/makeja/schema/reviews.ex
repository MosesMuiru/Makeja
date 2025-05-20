defmodule Makeja.Schema.Reviews do
  use Ecto.Schema

  alias Makeja.Schema.Attachments

  schema "reviews" do
    field :uuid, Ecto.UUID, autogenerate: true
    field :comment, :string

    belongs_to :attachments, Attachments
    timestamps()
  end
end
