defmodule HashRingTest do
  use ExUnit.Case
  alias ExHashRing.Ring

  test " hash ring demo" do
    {:ok, ring} = Ring.start_link()
    Ring.add_node(ring, "a")
    Ring.add_node(ring, "b")
    Ring.add_node(ring, "c")

    # 编写一个循环函数，测试所有的落点，并输出最终的比例
    result =
      Enum.reduce(1..10000, %{}, fn i, acc ->
        target = Ring.find_node(ring, "key#{i}")
        count = Map.get(acc, target, 0)
        Map.put(acc, target, count + 1)
      end)

    IO.puts(inspect(result, pretty: true))
  end

  test " hash ring demo 2" do
    {:ok, ring} = Ring.start_link()
    Ring.add_node(ring, "a")
    Ring.add_node(ring, "b")
    Ring.add_node(ring, "c", 254)

    # 编写一个循环函数，测试所有的落点，并输出最终的比例
    result =
      Enum.reduce(1..100_000, %{}, fn i, acc ->
        target = Ring.find_node(ring, "key#{i}")
        count = Map.get(acc, target, 0)
        Map.put(acc, target, count + 1)
      end)

    IO.puts(inspect(result, pretty: true))
  end
end
