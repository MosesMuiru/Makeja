defmodule Makeja.Repo.UsersRepo do
  alias Makeja.Schema.Users
  # insert user details
  # hash password
  # confirm number 
  alias Makeja.Repo
  @type response_t :: {:ok, %Users{}} | {:error, Ecto.Changeset.t()}

  @type user_t :: %Users{}

  @spec insert_user(user_t) :: response_t
  def insert_user(user) do
    %Users{}
    |> Users.changeset(user)
    |> Repo.insert()
  end
end
