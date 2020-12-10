defmodule EnumTest do
  use ExUnit.Case

  alias Enum

  @moduletag :capture_log

  doctest Enum

  test "module exists" do
    assert is_list(Enum.module_info())
  end
end
