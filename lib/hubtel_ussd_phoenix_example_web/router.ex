defmodule HubtelUssdPhoenixExampleWeb.Router do
  use HubtelUssdPhoenixExampleWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    # plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HubtelUssdPhoenixExampleWeb do
    pipe_through :browser

    post "/ussd", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", HubtelUssdPhoenixExampleWeb do
  #   pipe_through :api
  # end
end
