import Config

import_config "#{Mix.env()}.exs"

config :app, ecto_repos: [App.Infrastructure.Adapters.Repository.Repo]
