defmodule MakejaWeb.HomeLive do
  use MakejaWeb, :live_view

  import MakejaWeb.Components.HouseCard
  alias Makeja.Repo.HousesRepo

  def mount(_params, _args, socket) do
    houses = HousesRepo.get_all_houses()

    socket
    |> assign(:houses, houses)

    {:ok, socket}
  end

  def handle_event("more", %{"id" => id}, socket) do
    id
    |> IO.inspect(label: "idddd--->")

    {:noreply, redirect(socket, to: "/houses?id=#{id}")}
  end

  def handle_event("search_house", _, socket) do
    IO.inspect(label: "search button is woring")

    {:noreply, socket}
  end

  def handle_event("search_change", _unsigned_params, socket) do
    IO.inspect(label: "the search event is woring")

    {:noreply, socket}
  end
end
