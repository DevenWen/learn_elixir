defmodule EnumTest do
  use ExUnit.Case

  alias Enum

  @moduletag :capture_log

  #  doctest Enum

  test "module exists" do
    assert is_list(Enum.module_info())
  end

  test "Enum 提供超过70个操作枚举函数" do
    count = 0

    Enum.__info__(:functions)
    |> Enum.each(fn {function, arity} ->
      IO.puts("#{function}/#{arity}")
      # count 无法自增
      count = count + 1
    end)

    #    IO.puts("count functions: #{count}")
  end

  test "all" do
    assert !Enum.all?(["foo", "bar", "hello"], fn s -> String.length(s) == 3 end)
    assert Enum.all?(["foo", "bar", "hello"], fn s -> String.length(s) > 1 end)
  end

  test "any" do
    assert Enum.any?(["foo", "bar", "hello"], fn s -> String.length(s) == 5 end)
    assert !Enum.any?(["foo", "bar", "hello"], fn s -> String.length(s) == 0 end)
  end

  test "chunk_every 拆分小组" do
    # 按数量分拆列表
    assert [[1, 2], [3, 4]] == Enum.chunk_every([1, 2, 3, 4], 2)
  end

  test "chunk_by 拆分小组" do
    # 类似 group by
    chunkByLength =
      Enum.chunk_by(["one", "two", "three", "four", "five"], fn x ->
        String.length(x)
      end)

    assert [["one", "two"], ["three"], ["four", "five"]] == chunkByLength
  end

  test "map every 映射" do
    result = Enum.map_every([1, 2, 3, 4], 1, fn x -> x * x end)
    #    https://hexdocs.pm/elixir/1.10.4/Enum.html#map_every/3
    assert [1, 4, 9, 16] = result
  end

  test "each" do
    # 形同一般的 forearch
    Enum.each([1, 2, 3, 4], fn s -> IO.puts(s) end)
  end

  test "map" do
    result = Enum.map([1, 2, 3, 4], fn x -> x * x end)
    assert [1, 4, 9, 16] = result
  end

  test "mix max" do
    assert Enum.min([5, 3, 0, -1]) == -1
    assert Enum.max([5, 3, 0, -1]) == 5
  end

  test "filter" do
    # 形同一般的 assert
    assert [1, 2, 3, 4] == Enum.filter([1, 2, 3, 4, 5, 6], fn x -> x <= 4 end)
  end

  test "sort" do
    assert [1, 2, 3, 4, 5] == Enum.sort([1, 3, 4, 5, 2])
  end

  test "uniq" do
    # 删除重复元素
    assert [1, 2, 3] == Enum.uniq([1, 2, 1, 2, 1, 3, 2, 1, 2, 1, 3, 2, 1, 2, 1])
  end
end
