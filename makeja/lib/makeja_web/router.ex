defmodule MakejaWeb.Router do
  use MakejaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {MakejaWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MakejaWeb do
    pipe_through :browser

    # get "/", PageController, :home
    live "/upload", UploadDetailsLive
    live "/house", HomeLive
    live "/houses", HousesLive
    live "/signup", SignUpLive
    live "/login", LoginLive
    live "/otp", OtpLive
    live "/example", OLive
    live "/", HomeLive
  end

  scope "/admin", MakejaWeb do
    pipe_through :browser

    live "/upload", AdminUploadLive
  end

  pipeline :graphql do
    # Will be used later
  end

  # Other scopes may use custom stacks.
  scope "/api", MakejaWeb do
    pipe_through :api

    get "/v0/houses", HousesController, :index

    post "/v0/houses/upload", HousesController, :upload

    # forward "/graphiql", Absinthe.Plug.GraphiQL,
    #  schema: MakejaWeb.Graphql.Schema,
    #  interface: :simple,
    #  context: %{pubsub: MakejaWeb.Endpoint}

    # forward "/", Absinthe.Plug, schema: MakejaWeb.Graphql.Schema
    # graphql
    #  forward "/", Absinthe.Plug.GraphiQL, schema: MakejaWeb.Schema
  end

  scope "/v0/g/api" do
    pipe_through :graphql

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: MakejaWeb.Graphql.Schema,
      interface: :playground

    forward "/", Absinthe.Plug, schema: MakejaWeb.Graphql.Schema
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:makeja, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: MakejaWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
