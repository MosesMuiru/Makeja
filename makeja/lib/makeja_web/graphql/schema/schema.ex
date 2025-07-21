defmodule MakejaWeb.Graphql.Schema do
  use Absinthe.Schema

  alias MakejaWeb.Graphql.Resolvers

  object :house do
    field :uuid, :string
    field :house_name, :string
    field :description, :string
    field :price, :string
    field :property_type, :string
    field :bedrooms, :string
    field :bathrooms, :string
    field :square_feet, :integer
    field :address, :string
    field :city, :string
    field :county, :string
    field :latitude, :string
    field :longitude, :string
    field :status, :status_enum
  end

  enum :status_enum do
    value(:available, description: "This house is available")
    value(:rented, description: "This house is not available")
  end

  # query
  query do
    field :list_houses, list_of(:house) do
      resolve(&Resolvers.get_all_houses/3)
    end

    # this is get_house_by_uuid, returns the 

    field :get_house_by_uuid, :house do
      arg(:uuid, non_null(:string))
      resolve(&Resolvers.get_house_by_uuid/3)
    end
  end
end
