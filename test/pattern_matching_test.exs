defmodule PatternMatchingTest do
  use ExUnit.Case
  @moduletag :capture_log

  test "pattern matching A" do
    x = 1
    assert 1 = x
    assert 2 != x
    x = 2
    assert 1 != x
    assert 2 = x

    # 模式匹配异常
    # 1 = x
  end

  test "pattern matching list" do
    list = [1,2,3]
    [1,2,3] = list

    # [] = list  匹配异常
  end

  test "pattern matching tuples" do
    {:ok, value} = {:ok, "Successful!"}
    assert "Successful!" == value
  end


  test "Pin" do
    # = 除了是模式匹配，还能赋值，Pin 操作符是一个完整的匹配操作符
    x = 1
    ^x = 1
    x = 2
    ^x = 2
  end

  test "Pin 2" do
    key = "hello"
    %{^key => value} = %{"hello" => "world"}
    assert value = "world"
    # 可以用作 map 获取数据

    %{^key => value} = %{"hello" => "world", :hello => "world2"}
    assert value = "world"






  end

end
