use Mix.Config

config :sharpie, Sharpie.Endpoint,
  http: [port: System.get_env("PORT") || 4001]
