defmodule Makeja.Repo.HousesRepo do
  alias Makeja.Repo
  alias Makeja.Schema.House
  import Ecto.Query

  def insert_house(house_details) do
    %House{}
    |> House.changeset(house_details)
    |> Repo.insert()
  end

  @spec get_all_houses() :: [%House{}]
  def get_all_houses() do
    House
    |> Repo.all()
    |> Repo.preload(:attachments)
  end

  @spec get_house_by_uuid(id: binary()) :: %House{}
  def get_house_by_uuid(id) do
    House
    |> where([h], h.uuid == ^id)
    |> Repo.one()
  end
end
