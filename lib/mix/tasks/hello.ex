defmodule Mix.Tasks.Hello do
  use Mix.Task

  @shortdoc "Simple runs the Hello.say/0 command."
  def run(_) do
    HelloWorld.hello()
  end

end
