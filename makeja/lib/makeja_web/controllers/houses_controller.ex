defmodule MakejaWeb.HousesController do
  use MakejaWeb, :controller
  alias Makeja.Repo.HousesRepo
  alias Makeja.Schema.House

  def index(conn, _params) do
    houses = HousesRepo.get_all_houses()

    conn
    |> put_status(200)
    |> json(%{houses: houses})
  end

  def upload(conn, params) do
    House.changeset(%House{}, params)
    |> IO.inspect(label: "this is the params")

    params
    |> HousesRepo.insert_house()
    |> case do
      {:ok, house} ->
        conn
        |> put_status(200)
        |> json(%{houses: house})

      {:error, reason} ->
        conn
        |> put_status(500)
        |> json(%{error: reason})
    end
  end

  @spec decoding_to_json(map()) :: any()
  def decoding_to_json(data) do
    data
    |> Jason.decode!()
  end
end
