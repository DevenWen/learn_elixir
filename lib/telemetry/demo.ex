defmodule Telemetry.Demo do

  def process_message(message) do
    start_metadata = %{message: message}
    IO.puts("self(): #{inspect(self())}")
    :telemetry.span(
      [:web, :request],
      start_metadata,
      fn ->
        IO.puts("self(): #{inspect(self())}")
        Process.sleep(1000)
        result = "Hello #{message}"
        {result, %{metadata: "infomation about result"}}
      end
    )
  end

end
