defmodule Sharpie.Endpoint do
  use Phoenix.Endpoint, otp_app: :sharpie

  plug Plug.Static,
    at: "/", from: :sharpie

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_sharpie_key",
    signing_salt: "NM93acS2",
    encryption_salt: "7RssnCU+"

  plug :router, Sharpie.Router
end
