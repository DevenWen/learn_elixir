defmodule LearnTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  @doc """
  测试 IO 输出
  """
  test "capture_io or log" do
    assert capture_io(fn -> IO.puts("Hello World") end) == "Hello World\n"
  end

  # Test 配置
  setup_all do
    {:ok, number: 2}
  end

  test "the truth", state do
    assert 1 + 1 == state[:number]
  end
end
