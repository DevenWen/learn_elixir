defmodule MySigils do
  @moduledoc """
  自定义 Sigil
  """

  @doc """
  自定义的 sigil，将参数大写
  """
  def sigil_p(string, []), do: String.upcase(string)
end
