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
    x = 1
  end

end
