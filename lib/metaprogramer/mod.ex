defmodule Metaprogramer.Mod do
  defmacro definfo do
    IO.puts("In macro's context (#{__MODULE__})")
    IO.puts("hello, 期望使 compile 期")

    caller = __CALLER__.file

    quote do
      IO.puts("In macro's context (#{__MODULE__})")
      IO.puts("hello, 期望是 运行期")
      IO.puts("caller: #{inspect(unquote(caller))}")
    end
  end
end
