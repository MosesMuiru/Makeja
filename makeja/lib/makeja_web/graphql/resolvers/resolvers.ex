defmodule MakejaWeb.Graphql.Resolvers do
  alias Makeja.Repo.HousesRepo

  # houses
  def get_all_houses(_parents, _args, _resolution) do
    {:ok, HousesRepo.get_all_houses()}
  end

  def get_house_by_uuid(_parent, %{uuid: uuid}, _resolution) do
    {:ok, HousesRepo.get_house_by_uuid(uuid)}
  end
end
