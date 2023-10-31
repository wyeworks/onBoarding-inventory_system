defmodule InventorySystemWeb.Router do
  use InventorySystemWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", InventorySystemWeb do
    pipe_through :api
    get "/products", ProductController, :index
    post "/products", ProductController, :create
    get "/products/:id", ProductController, :show
    delete "/products/:id", ProductController, :delete
    put "/products/:id", ProductController, :update
    get "/products/control-product/:id", ProductController, :control_product

    get "/receptions", ReceptionController, :index
    post "/receptions", ReceptionController, :create
    get "/receptions/:id", ReceptionController, :show
    delete "/receptions/:id", ReceptionController, :delete
    put "/receptions/:id", ReceptionController, :update

    get "/control_products", Control_ProductController, :index
    post "/control_products", Control_ProductController, :create
    get "/control_products/:id", Control_ProductController, :show
    delete "/control_products/:id", Control_ProductController, :delete
    put "/control_products/:id", Control_ProductController, :update
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:inventory_system, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: InventorySystemWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
