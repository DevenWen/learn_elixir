defmodule Demo.Greetings do
  @moduledoc false

  @greeting "Hi"

  def morning(name) do
    "#{@greeting} Goods morning #{name}"
  end

  def evening(name) do
    "Goods night #{name}}"
  end
end
