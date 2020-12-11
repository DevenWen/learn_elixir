defmodule ModuleDemo.UserTest do
  use ExUnit.Case

  @moduletag :capture_log

  test "module exists" do
    assert is_list(ModuleDemo.User.module_info())
  end

  test "dto" do
    user = %ModuleDemo.User{}
    %{name: value} = user
    assert value == "Sean"
  end

end
