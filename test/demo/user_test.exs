defmodule ModuleDemo.UserTest do
  use ExUnit.Case

  # 别名，改别名，
  alias ModuleDemo.User, as: Man

  @moduletag :capture_log
  test "module exists" do
    assert is_list(ModuleDemo.User.module_info())
  end

  test "Module struct" do
    user = %Man{}
    # 提取结构体的数据
    %{name: value} = user
    assert value == "Sean"
  end

  test "Module struct 2" do
    # 创建并定义结构体
    user = %Man{name: "qpm", roles: [:manager]}
    assert %{name: "qpm"} = user
  end

  test "Module struct 3" do
    user = %Man{name: "qpm", roles: [:manager]}
    #    call error
    #    assert %{roles: [:manager]} = inspect(user)
    #    因为 roles 已经被隐藏，所有 roles 无法被匹配
    assert %{name: "qpm"} = user
  end

  import List, only: [delete: 2]

  test "import" do
    l = [1, 2, 3, 4]
    # delete
    # 报错
    l = delete(l, 2)
    assert [1, 3, 4] == l
  end
end
