defmodule MakejaWeb.LoginLive do
  alias Makeja.Repo.UsersRepo
  use MakejaWeb, :live_view

  def mount(_params, _, socket) do
    socket =
      socket
      |> assign(phone: "")
      |> assign(pass: "")

    {:ok, socket}
  end

  def handle_event(
        "login_to_account",
        %{"phone_number" => phone_number, "password" => password},
        socket
      ) do
    verify_password(phone_number, password)

    {:noreply, socket}
  end

  def handle_event(
        "submit",
        %{"phone_number" => phone_number, "password" => password} = _params,
        socket
      ) do
    verify_password(phone_number, password)
    |> case do
      true ->
        {:noreply,
         socket
         |> put_flash(:info, "Otp has been sent")}

      false ->
        {:noreply, put_flash(socket, :error, "Buda, wrong Password")}
    end
  end

  @spec verify_password(String.t(), String.t()) :: boolean
  def verify_password(phone_number, password) do
    phone_number
    |> UsersRepo.get_user_by_phone_number()
    |> case do
      {:ok, user} ->
        Bcrypt.verify_pass(password, user.password_hash)

      {:error, reason} ->
        reason

        false
    end
  end
end
