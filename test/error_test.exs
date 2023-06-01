defmodule ErrorTest do
  use ExUnit.Case
  @moduletag :capture_log

  test "Raise" do
    assert_raise RuntimeError, fn -> raise "Oh, no!" end
  end

  test "Raise 2" do
    assert_raise MyRuntimeException, fn ->
      raise MyRuntimeException, message: "the argument value is invalid"
    end
  end

  test "try-rescue" do
    try do
      raise MyRuntimeException, message: "An error call here"
    rescue
      e in MyRuntimeException -> IO.puts("An error occurred: " <> e.message)
    end
  end

  test "try-rescue-after" do
    point = 0

    try do
      assert point == 0
      raise MyRuntimeException, message: "An error call here"
    rescue
      e in MyRuntimeException -> assert point == 0
    after
      point = 1
      assert point == 1
    end

    # 不能使用顺序编程的思路去理解，不能往函数程序中传值
    refute point == 1
  end
end
