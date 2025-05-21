defmodule Makeja.Schema.House do
  use Ecto.Schema

  alias Makeja.Schema.Attachments
  alias Makeja.Schema.Users
  import Ecto.Changeset

  schema "houses" do
    field :uuid, Ecto.UUID, autogenerate: true
    field :house_name, :string
    field :description, :string
    field :price, :string
    field :property_type, :string
    field :bedrooms, :integer
    field :bathrooms, :integer
    field :square_feet, :integer
    field :address, :string
    field :city, :string
    field :county, :string
    field :latitude, :string
    field :longitude, :string

    field :status, Ecto.Enum, values: [:available, :rented], default: :available

    # can be an agent also
    belongs_to :user, Users
    has_many :attachments, Attachments
    timestamps()
  end

  def changeset(house, params \\ %{}) do
    house
    |> cast(params, [:house_name])
  end
end
