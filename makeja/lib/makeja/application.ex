defmodule Makeja.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MakejaWeb.Telemetry,
      Makeja.Repo,
      {DNSCluster, query: Application.get_env(:makeja, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Makeja.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Makeja.Finch},
      # Start a worker by calling: Makeja.Worker.start_link(arg)
      # {Makeja.Worker, arg},
      # Start to serve requests, typically the last entry
      MakejaWeb.Endpoint,
      # this is to start my cache
      # table name --> is the cache
      {Makeja.Cache.MyCache, name: "otp_cache"}
    ]

    :mnesia.create_schema([node()])
    :mnesia.start()

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Makeja.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def applicationd do
    [
      extra_applications: [:mnesia]
    ]
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MakejaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
