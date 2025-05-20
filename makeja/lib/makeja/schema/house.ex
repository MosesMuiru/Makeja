defmodule Makeja.Schema.House do
  use Ecto.Schema

  # alias Makeja.Schema.Attachments
  alias Makeja.Schema.Users

  schema "houses" do
    field :uuid, Ecto.UUID, autogenerate: true
    field :house_name, :string

    belongs_to :users, Users
    #  has_many :attachements, Attachments
  end
end
