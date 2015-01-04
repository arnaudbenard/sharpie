defmodule Sharpie.ImageController do
  use Phoenix.Controller
  import Mogrify

  plug :action

  def index(conn, _params) do
    image = open("priv/static/images/phoenix.png") |> verbose
    json conn, %{image: image}
  end

  def upload(conn, _params) do
    img = _params["img"]
    info = open(img.path) |> verbose
    json conn, %{image: info}
  end

end
