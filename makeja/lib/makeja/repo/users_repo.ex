defmodule Makeja.Repo.UsersRepo do
  alias Makeja.Schema.Users
  # insert user details
  # hash password
  # confirm number 
  alias Makeja.Repo
  import Ecto.Query

  @type response_t :: {:ok, %Users{}} | {:error, Ecto.Changeset.t()}

  @type user_t :: %Users{}

  @type s :: String.t()

  @spec insert_user(user_t) :: response_t
  def insert_user(user) do
    %Users{}
    |> Users.changeset(user)
    |> Repo.insert()
  end

  @spec get_user_by_id(String.t()) :: response_t()
  def get_user_by_id(user_id) do
    User
    |> where([u], u.uuid == ^user_id)
    |> Repo.one()
  end

  @spec get_user_by_phone_number(s) :: response_t
  def get_user_by_phone_number(phone_number) do
    User
    |> where([u], u.phone_number == ^phone_number)
    |> Repo.one()
  end
end
