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
    check_if_user_exists(:phone_number, user.phone_number)
    |> IO.inspect(label: "phone_number")
    |> case do
      true ->
        %Users{}
        |> Users.changeset(user)
        |> Repo.insert()

      false ->
        {:error, "User Exists"}
    end
  end

  @spec get_user_by_id(String.t()) :: response_t()
  def get_user_by_id(user_id) do
    Users
    |> where([u], u.uuid == ^user_id)
    |> Repo.one()
  end

  @spec get_user_by_phone_number(s) :: response_t
  def get_user_by_phone_number(phone_number) do
    IO.inspect(phone_number, label: "its working")

    Users
    |> where([u], u.phone_number == ^phone_number)
    |> Repo.one()
  end

  @spec check_if_user_exists(atom(), String.t()) :: boolean()
  def check_if_user_exists(:phone_number, phone_number) do
    Users
    |> where([u], u.phone_number == ^phone_number)
    |> Repo.all()
    |> IO.inspect(label: "returrnnn---")
    |> case do
      {:ok, _} -> false
      _ -> true
    end
  end

  @spec get_user_by_phone_number_and_id(s, s) :: response_t
  def get_user_by_phone_number_and_id(user_id, phone_number) do
    Users
    |> where([u], u.phone_number == ^phone_number and u.uuid == ^user_id)
    |> Repo.one()
  end
end
