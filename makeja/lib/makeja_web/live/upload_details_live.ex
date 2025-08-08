defmodule MakejaWeb.UploadDetailsLive do
  use MakejaWeb, :live_view

  import MakejaWeb.CoreComponents

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
     |> assign(:show, false)
     |> allow_upload(:avatar, accept: ~w(.jpg .jpeg .png .mp4), max_entries: 5)}
  end

  def handle_event("state", params, socket) do
    [_ | [name]] =
      params
      |> Map.keys()

    value = params[name]

    {:noreply,
     socket
     |> assign(String.to_atom(name), value)}
    |> assign(:focus, {name, true})
  end

  def handle_event("on_submit", params, socket) do
    {:noreply, socket}
  end

  # Forms in put

  def handle_event("save", params, socket) do
    params
    |> IO.inspect(label: "THisare the parammmm")

    uploaded_files =
      consume_uploaded_entries(socket, :avatar, fn %{path: path}, _entry ->
        dest = Path.join(Application.app_dir(:my_app, "priv/static/uploads"), Path.basename(path))
        # You will need to create `priv/static/uploads` for `File.cp!/2` to work.
        File.cp!(path, dest)
        {:ok, ~p"/uploads/#{Path.basename(dest)}"}
      end)

    socket =
      socket
      |> assign(:show, true)

    {:noreply, update(socket, :uploaded_files, &(&1 ++ uploaded_files))}
  end

  def handle_event("upload_images", _params, socket) do
    socket =
      socket

    {:noreply,
     socket
     |> assign(:upload_image_modal, true)}
  end

  def handle_event("validate", _params, socket) do
    {:noreply, socket}
  end

  def handle_event("data-cancel", params, socket) do
    params

    {:noreply, socket}
  end

  def handle_event("on_blur", params, socket) do
    params

    {:noreply, socket}
  end

  defp error_to_string(:too_large), do: "Too large"
  defp error_to_string(:not_accepted), do: "You have selected an unacceptable file type"
end
