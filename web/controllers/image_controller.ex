defmodule Sharpie.ImageController do
  use Phoenix.Controller
  import Mogrify

  plug :action

  def index(conn, _params) do
    image = open("priv/static/images/phoenix.png") |> verbose
    json conn, %{image: image}
  end
end
