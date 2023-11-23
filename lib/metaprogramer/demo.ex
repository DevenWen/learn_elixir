defmodule Metaprogramer.Demo do
  require Metaprogramer.Mod
  # Metaprogramer.Mod.definfo()

  defmacro hello do
    if Application.get_env(:metaprogramer, :hello) do
      quote do: IO.puts("Hello World!")
    else
      quote do: IO.puts("Hello!")
    end
  end

  def info do
    Metaprogramer.Mod.definfo()
  end
end
