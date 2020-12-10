defmodule ModuleDemoTest do
  use ExUnit.Case
  doctest ModuleDemo

  test "test module" do
    # 模块是组织函数的概念，是一个系列函数的集合
    # 能够给予 模块 来理解类么？
    # 不行的，类有字段，但模块没有
    # Erlang 的状态存储在哪里呢？目前能知道的：存储在它自己的进程中

    assert "Hello qpm" == ModuleDemo.greeting("qpm")
  end

end
