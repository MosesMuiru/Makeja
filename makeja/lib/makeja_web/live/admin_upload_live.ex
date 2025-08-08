defmodule MakejaWeb.AdminUploadLive do
  use MakejaWeb, :live_view

  @moduledoc """
      This will contain a form for uploading images
      
    max of diff upload 4 images
    upload a video 

    or just include all of them in them
  """

  @impl true
  def mount(_params, _args, socket) do
    {:ok,
     socket
     |> assign(:upload_files, [])
     |> allow_upload(:house_images, accept: ~w{.jpg .jpeg .png .mp4}, max_entries: 4)}
  end

  def handle_event("save", params, socket) do
    params

    upload_files =
      consume_uploaded_entries(socket, :house_images, fn %{path: path}, _entry ->
        dest =
          Path.join([:code.priv_dir(:makeja), "static", "uploads", Path.basename(path)])

        # You will need to create `priv/static/uploads` for `File.cp!/2` to work.
        File.cp!(path, dest)
        {:ok, ~p"/uploads/#{Path.basename(dest)}"}
      end)

    {:noreply, update(socket, :upload_files, &(&1 ++ upload_files))}
  end

  def handle_event("buddaa", _, socket) do
    {:noreply, socket}
  end

  @impl true
  def handle_event("validate", params, socket) do
    params
    |> IO.inspect(label: "here")

    {:noreply, socket}
  end

  def handle_event("cancel-upload", %{"ref" => ref}, socket) do
    {:noreply, cancel_upload(socket, :house_images, ref)}
  end

  defp error_to_string(:too_large), do: "Too large"
  defp error_to_string(:too_many_files), do: "You have selected too many files"
  defp error_to_string(:not_accepted), do: "You have selected an unacceptable file type"
end
