defmodule GenStage.Consumer do
  use GenStage

  def init(:ok) do
    {:consumer, :ok}
  end


  def handle_events(events, _from, state) do
    IO.inspect(events, label: "Consumer received events")
    Process.sleep(1000)
    {:noreply, [], state}
  end

end
