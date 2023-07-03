defmodule Learn.Elixir.Application do
  use Application
  require Logger

  def start(_type, _args) do
    Logger.info("Starting application at learn elixir project!")

    :ok = :telemetry.attach_many(
      "telemetry-demo",
      [
        [:web, :request, :start],
        [:web, :request, :stop],
        [:web, :request, :exception]
      ],
      &Telemetry.Handler.handle_event/4,
      nil
    )

    children = []
    Supervisor.start_link(children, strategy: :one_for_one)
  end

end
