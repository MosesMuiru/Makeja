defmodule Makeja.Repo do
  use Ecto.Repo,
    otp_app: :makeja,
    adapter: Ecto.Adapters.Postgres
end
