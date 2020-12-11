defmodule ExampleApp.Mixfile do
  @moduledoc false

  def project do
    [app: :example_app, version: "0.0.1", escript: [main_module: HelloWorld.CLI]]
  end

end
