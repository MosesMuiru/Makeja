defmodule MakejaWeb.HomeLive do
  use MakejaWeb, :live_view

  import MakejaWeb.Components.HouseCard

  def mount(_params, _args, socket) do
    {:ok, socket}
  end
end
