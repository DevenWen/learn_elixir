defmodule Concurrent.ExampleV2 do
  @moduledoc false

  def listen do
    receive do
      {:ok, "hello"} ->
        IO.puts("World")
    end

    listen()
  end
end
