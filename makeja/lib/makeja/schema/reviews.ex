defmodule Makeja.Schema.Reviews do
  use Ecto.Schema

  alias Makeja.Schema.Attachments

  schema "reviews" do
    field :uuid, Ecto.UUID, autogenerate: true
    field :comment, :string

    belongs_to :attachments, Attachments
    belongs_to :users, Makeja.Schema.Users
    timestamps()
  end
end
