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

    # - `GET /api/images/` -> List all the images infos
    get "/", ImageController, :index
    # - `POST /api/images/` -> Upload image
    post "/", ImageController, :convert
    # - `GET /api/images/:id` ->  Get image
    get "/:id", ImageController, :show
    # - `POST /api/images/:id/convert` -> Convert image
    post "/:id/convert", ImageController, :convert

  end
end
