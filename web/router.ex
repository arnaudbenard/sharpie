defmodule Sharpie.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
  end

  pipeline :api do
    plug :accepts, ~w(json)
  end

  scope "/", Sharpie do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Images API
  scope "/api/images/", Sharpie do
    # pipe_through :api

    get "/", ImageController, :index
    post "/", ImageController, :upload
  end
end
