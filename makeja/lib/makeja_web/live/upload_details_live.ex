defmodule MakejaWeb.UploadDetailsLive do
  use MakejaWeb, :live_view

  import MakejaWeb.CoreComponents
  import MakejaWeb.Components.UploadComponent

  def mount(_params, _session, socket) do
    inputs = %{
      house_name: nil,
      description: nil,
      property_type: nil,
      price: nil,
      bathrooms: nil,
      bedrooms: nil,
      square_feet: nil,
      city: nil,
      county: nil,
      latitude: nil,
      longitude: nil,
      action: nil
    }

    {:ok,
     socket
     |> assign(:upload_image_modal, false)
     |> assign(inputs)
     |> assign(:uploaded_files, [])
     |> allow_upload(:avatar, accept: ~w(.jpg .jpeg .png .mp4), max_entries: 5)}
  end

  def handle_event("state", params, socket) do
    [_ | [name]] =
      params
      |> Map.keys()
      |> IO.inspect(label: "this is working")

    value = params[name]

    {:noreply,
     socket
     |> assign(String.to_atom(name), value)}
    |> assign(:focus, {name, true})
  end

  def handle_event("on_submit", params, socket) do
    params
    |> IO.inspect(label: "submit")

    {:noreply, socket}
  end

  def handle_event("upload_images", _params, socket) do
    IO.inspect("Its working")

    socket =
      socket

    {:noreply,
     socket
     |> assign(:upload_image_modal, true)}
  end

  def handle_event("data-cancel", params, socket) do
    params
    |> IO.inspect(label: "on focus")

    {:noreply, socket}
  end

  def handle_event("on_blur", params, socket) do
    params
    |> IO.inspect(label: "on blur")

    {:noreply, socket}
  end
end
