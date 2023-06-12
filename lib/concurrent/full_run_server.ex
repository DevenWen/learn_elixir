defmodule FullRunServer do
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    # Spawn a new process to run the load
    spawn_link(fn -> run_load() end)

    # Return :ok to indicate successful initialization
    {:ok, nil}
  end

  defp run_load do
    # Run an infinite loop to keep the process busy
    loop()
  end

  defp loop do
    # Perform a simple calculation to keep the CPU busy
    Enum.reduce(1..1_000_000, 0, fn x, acc -> x + acc end)

    # Sleep for a short time to avoid consuming too much CPU
    # Process.sleep(1)

    # Call loop recursively to keep the process running
    loop()
  end
end