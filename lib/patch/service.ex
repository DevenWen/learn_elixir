defmodule Patch.Service do
  def public_call(args) do
    {:origin, args}
  end

  def public_call(arg1, args2), do: {:origin, arg1, args2}

  def public_call_private(args) do
    private_call(args)
  end

  defp private_call(args) do
    {:origin, :private, args}
  end
end
