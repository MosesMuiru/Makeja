defmodule MakejaWeb.SignUpLive do
  use MakejaWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_event("create_account", params, socket) do
    params
    |> IO.inspect(label: "this are the subs")

    {:noreply, socket}
  end

  def handle_event("validate-phone", params, socket) do
    params
    |> IO.inspect(label: "validate is working")

    {:noreply, socket}
  end

  def handle_event("validate-password", params, socket) do
    params
    |> IO.inspect(label: "validate is working")

    {:noreply, socket}
  end
end
