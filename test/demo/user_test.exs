defmodule ModuleDemo.UserTest do
  use ExUnit.Case

  alias User

  @moduletag :capture_log

  doctest User

  test "module exists" do
    assert is_list(User.module_info())
  end

  test "dto" do
    user = %User{}
    %{name: value} = user
    assert value == "Sean"
  end

end
