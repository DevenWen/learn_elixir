defmodule Type.AStruct do
  defstruct [:a, :b, :c]

  @spec compile(%Type.AStruct{}) :: any()
  def compile(%Type.AStruct{} = s) do
    IO.puts(s.a)
    IO.puts(s.d)
  end
end
