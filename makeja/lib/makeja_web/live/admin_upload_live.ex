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
    |> IO.inspect(label: "this are the params")

    {:noreply, socket}
  end

  @impl true
  def handle_event("validate", params, socket) do
    params
    |> IO.inspect(label: "here")

    {:noreply, socket}
  end

  def handle_event("cancel-upload", %{"ref" => ref}, socket) do
    ref
    |> IO.inspect(label: "upload has been canceled")

    {:noreply, socket}
  end
end
