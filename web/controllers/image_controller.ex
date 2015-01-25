defmodule Sharpie.ImageController do
  use Phoenix.Controller
  import Mogrify

  plug :action

  def index(conn, _params) do
    image = open("priv/static/images/phoenix.png")
     {:ok, image_file} = File.open(image.path, [:read])

    image_data = IO.binread(image_file, :all)
    # json conn, %{image: image}
    conn
    |> put_resp_content_type("image/jpeg")
    |> send_resp(200, image_file)
  end

  def upload(conn, _params) do
    img = _params["img"]
    info = open(img.path) |> verbose
    json conn, %{image: info}
  end

  def show(conn, _params) do
    img = _params["img"]
    info = open(img.path) |> verbose
    json conn, %{image: info}
  end

  def convert(conn, _params) do
    img = _params["img"]
    IO.puts inspect(_params)
    # info = open(img.path) |> verbose
    # json conn, %{image: info}
    converted_image = open(img.path) |> resize("100x100")
    {:ok, image_file} = File.open(converted_image.path, [:read])

    # render converted_image
    # converted_image
    image_data = IO.binread(image_file, :all)
    IO.puts inspect(image_data)
    conn
    |> put_resp_content_type("image/jpeg")
    |> send_resp(200, image_file)
    # conn |> send_response(200, "image/jpeg", image_data)
    # send_resp(conn, conn.status || 200, "image/jpeg", image_data)
    # conn
    # |> put_resp_content_type("image/jpeg")
    # |> send_response(conn.status, "image/jpeg" || 200, image_data)
    # conn
    # |> put_resp_content_type("image/jpeg")
    # |> render "image.jpg", content: image_data
  end

end
