defmodule MakejaWeb.HomeLive do
  use MakejaWeb, :live_view

  import MakejaWeb.Components.HouseCard

  def mount(_params, _args, socket) do
    {:ok, socket}
  end

  def handle_event("more", %{"id" => id}, socket) do
    id
    |> IO.inspect(label: "idddd--->")

    {:noreply, redirect(socket, to: "/houses?id=#{id}")}
  end
end
