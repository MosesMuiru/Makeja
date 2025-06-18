defmodule MakejaWeb.OtpLive do
  use MakejaWeb, :live_view

  def mount(_, _session, socket) do
    {:ok, socket}
  end
end
