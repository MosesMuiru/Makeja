defmodule Makeja.Repo.HousesRepo do
  alias Makeja.Repo
  alias Makeja.Schema.House

  def insert_house(house_details) do
    %House{}
    |> House.changeset(house_details)
    |> Repo.insert()
  end
end
