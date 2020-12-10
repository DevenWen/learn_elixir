defmodule GreetingsTest do
  use ExUnit.Case

  alias Greetings

  @moduletag :capture_log

  doctest Greetings

  test "module exists" do
    assert is_list(Greetings.module_info())
  end

  test "test module fun" do
    assert "Goods night qpm}" == Greetings.evening("qpm")
  end

  test "test module fun2" do
    assert "Hi Goods morning qpm" == Greetings.morning("qpm")
  end


end
