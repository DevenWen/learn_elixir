defmodule ComprehensionsTest do
  use ExUnit.Case
  @moduletag :capture_log

  test "推导 1" do
    list = [1, 2, 3, 4, 5]
    list2 = for x <- list, do: x * x
    assert [1, 4, 9, 16, 25] == list2
  end

  test "推导 2" do
    result =
      for {_key, val} <- [one: 1, two: 2, three: 3] do
        val
      end

    assert [1, 2, 3] = result
  end

  test "推导 3" do
    result =
      for {:ok, val} <- [ok: "Hello", error: "Unknown", ok: "World"] do
        val
      end

    assert result == ["Hello", "World"]
  end

  test "推导4 嵌套 推导" do
    # 模拟嵌套查询
    list = [1, 2, 3, 4]

    result =
      for n <- list, times <- 1..n do
        String.duplicate("*", times)
      end

    assert ["*", "*", "**", "*", "**", "***", "*", "**", "***", "****"] == result

    '''
    for n in list:
      for times in range(1, n):
        # times
    '''
  end

  import Integer

  test "推导 5 过滤 filter" do
    result = for x <- 1..10, is_even(x), do: x
    assert [2, 4, 6, 8, 10] == result
  end

  test "推导 6 into 出其他类型" do
    result = for {k, v} <- [one: 1, two: 2, three: 3], into: %{}, do: {k, v}
    assert %{one: 1, two: 2, three: 3} == result
  end
end
