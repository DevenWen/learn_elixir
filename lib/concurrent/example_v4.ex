defmodule Concurrent.ExampleV4 do
  @moduledoc false

  alias Concurrent.ExampleV4

  def explode, do: exit(:kaboom)

  def run do
    spawn_monitor(ExampleV4, :explode, [])

    receive do
      {:DOWN, _ref, :process, _from_pid, reason} ->
        IO.puts("Exit reason: #{reason}")
    end
  end
end
