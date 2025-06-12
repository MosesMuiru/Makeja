defmodule MakejaWeb.HousesLive do
  use MakejaWeb, :live_view

  def mount(args, params, socket) do
    args
    |> IO.inspect(label: "args")

    params
    |> IO.inspect(label: "paramsm")

    {:ok, socket}
  end
end
