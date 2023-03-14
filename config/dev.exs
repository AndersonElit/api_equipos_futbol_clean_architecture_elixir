import Config

config :app, timezone: "America/Bogota"

config :app,
  http_port: 8083,
  enable_server: true,
  secret_name: "",
  version: "0.0.1",
  in_test: false,
  custom_metrics_prefix_name: "app_local"

config :logger,
  level: :debug

# tracer
config :opentelemetry,
  span_processor: :batch,
  traces_exporter: {:otel_exporter_stdout, []}

config :app, App.Infrastructure.Adapters.Repository.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "postgres",
  port: "5432",
  pool_size: 10,
  telemetry_prefix: [:elixir, :repo]

config :app,
  equipos_behaviour: App.Infrastructure.Adapters.Repository.Equipo.EquipoDataRepository
