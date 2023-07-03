defmodule Telemetry.Handler do

  require Logger

  def handle_event([:web, :request, _] = event, measurements, metadata, config) do
    Logger.info("event: #{inspect(event)}")
    Logger.info("measurements: #{inspect(measurements)}")
    Logger.info("metadata: #{inspect(metadata)}")
    Logger.info("config: #{inspect(config)}")
  end


end
