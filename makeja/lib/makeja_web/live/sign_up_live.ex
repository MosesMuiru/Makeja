defmodule MakejaWeb.SignUpLive do
  alias Makeja.Repo.UsersRepo
  use MakejaWeb, :live_view

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(validate: false)
      |> assign(password_length: "")
      |> assign(account_creation_confirmation: "")

    {:ok, socket}
  end

  def handle_event("save", params, socket) do
    params
    |> IO.inspect(label: "this are the subs")

    {:noreply, socket}
  end

  def handle_event("validate-phone", params, socket) do
    params
    |> IO.inspect(label: "validate is working")

    {:noreply, socket}
  end

  def handle_event("validate", params, socket) do
    params
    |> IO.inspect(label: "validating")

    {:noreply, socket}
  end

  def handle_event(
        "create_account",
        %{
          "username" => username,
          "number" => number,
          "password" => password,
          "confirm-password" => confirm_password
        },
        socket
      ) do
    validate =
      password == confirm_password &&
        input_validatation(:password, password)

    # check input validataion
    # account_creation_confirmation =
    validate
    |> case do
      true ->
        hash = hash_passwords(password)

        %{
          username: username,
          phone_number: number,
          password_hash: hash,
          role: "user"
        }
        |> UsersRepo.insert_user()
        |> IO.inspect(label: "whuuu")
        |> case do
          {:ok, user} ->
            "Welcome #{user.username}"
            |> IO.inspect(label: "hakuna error")

            {:noreply,
             socket
             |> put_flash(:info, "Otp has been sent")
             |> redirect(to: "/example")}

          # {:noreply, put_flash(socket, :info, "Buda welcome")}

          {:error, reason} ->
            "Error creating account"
            |> IO.inspect()

            {:noreply, put_flash(socket, :error, reason)}
        end

      false ->
        {:noreply, put_flash(socket, :error, "Kuna error flani hii niya mwisho")}
    end

    # hash them passwords

    #    socket =
    #  socket
    #  |> assign(validate: validate)
    #  |> assign(password_length: validate)
    #  |> assign(account_creation_confirmation: account_creation_confirmation)

    # {:noreply, socket}
  end

  def input_validatation(:password, password) do
    Regex.match?(~r/^.{8,20}$/, password)
  end

  def input_validation(:phone_number, phone_number) do
    Regex.match?(~r/^\d{10}$/, phone_number)
  end

  defp hash_passwords(password) do
    password
    |> Bcrypt.hash_pwd_salt()
  end
end
