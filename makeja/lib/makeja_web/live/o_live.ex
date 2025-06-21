defmodule MakejaWeb.OLive do
  use MakejaWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:code, ["", "", "", "", ""])
     |> assign(:phone_number, "0712XXXXX")
     |> assign(:confirming, false)
     |> assign(:error_message, nil)}
  end

  @impl true
  def handle_event("update_digit", %{"index" => index, "value" => value}, socket) do
    IO.inspect(index, label: "theee index")
    index = String.to_integer(index)

    # Only allow single digits
    sanitized_value =
      value
      |> String.replace(~r/[^0-9]/, "")
      |> String.slice(0, 1)

    new_code = List.replace_at(socket.assigns.code, index, sanitized_value)

    {:noreply, assign(socket, :code, new_code)}
  end

  def handle_event("digit", params, socket) do
    params
    |> IO.inspect(label: "ppp")

    {:noreply, socket}
  end

  def handle_event("change", params, socket) do
    params
    |> IO.inspect(label: "this si working")

    {:noreply, socket}
  end

  @impl true
  def handle_event("paste_code", %{"value" => value}, socket) do
    # Extract digits from pasted content
    digits =
      value
      |> String.replace(~r/[^0-9]/, "")
      |> String.slice(0, 5)
      |> String.graphemes()

    # Pad with empty strings if needed
    padded_digits = digits ++ List.duplicate("", 5 - length(digits))
    new_code = Enum.take(padded_digits, 5)

    {:noreply, assign(socket, :code, new_code)}
  end

  @impl true
  def handle_event("confirm_code", params, socket) do
    input = ""

    input =
      params
      |> IO.inspect(label: "-----code")
      |> Enum.map(fn {_key, value} ->
        # form a new  form a new string 

        input <> value
      end)
      |> Enum.join()

    if String.length(input) != 5 do
      {:noreply, assign(socket, :error_message, "Please enter all 5 digits")}
    else
      # Start confirmation process
      send(self(), {:confirm_code, input})

      {:noreply,
       socket
       |> assign(:confirming, true)
       |> assign(:error_message, nil)}
    end
  end

  @impl true
  def handle_event("resend_code", _params, socket) do
    # Simulate resending code
    Process.send_after(self(), :resend_complete, 1000)

    {:noreply,
     socket
     |> assign(:code, ["", "", "", "", ""])
     |> assign(:error_message, nil)
     |> put_flash(:info, "Verification code sent!")}
  end

  @impl true
  def handle_info({:confirm_code, code}, socket) do
    # Simulate API call delay
    Process.sleep(1500)

    # Here you would typically verify the code with your backend
    case verify_code(code) do
      {:ok, _result} ->
        {:noreply,
         socket
         |> assign(:confirming, false)
         |> put_flash(:info, "Email verified successfully!")
         # Redirect to next page
         |> push_navigate(to: "/dashboard")}

      {:error, reason} ->
        {:noreply,
         socket
         |> assign(:confirming, false)
         |> assign(:error_message, reason)}
    end
  end

  @impl true
  def handle_info(:resend_complete, socket) do
    {:noreply, socket}
  end

  # Mock verification function - replace with your actual verification logic
  defp verify_code(code) do
    # Simulate success for demo (replace with actual verification)
    if code == "12345" do
      {:error, "Invalid verification code"}
    else
      {:ok, :verified}
    end
  end
end
