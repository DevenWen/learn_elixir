defmodule Concurrent.ExampleV3 do
  @moduledoc false

  def explode() do
    IO.puts("进程模拟奔溃： kaboom")
    exit(:kaboom)
  end


  def run do
    Process.flag(:trap_exit, true)
    spawn_link(Concurrent.ExampleV3, :explode, [])

    receive do
      {:EXIT, _from_pid, reason} ->
        IO.puts("Exit reason: #{reason}")
    end
  end

end
