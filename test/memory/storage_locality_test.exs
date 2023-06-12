defmodule Memory.StorageLocalityTest do
  use ExUnit.Case
  doctest Memory.StorageLocality
  alias Memory.StorageLocality

  # 编写一个 benchee 的测试，测试 good 和 bad 方法的性能差异

  @tag :skip
  test "benchee test for StorageLocality" do
    Benchee.run(
      %{
        "good" => fn -> StorageLocality.good() end,
        "bad" => fn -> StorageLocality.bad() end
      },
      time: 5,
      memory_time: 5
    )
  end

  # 编写一个单元测试，验证变量的存储大小
  @tag :skip
  test "test for StorageLocality" do

    size1 = 1..100 |> Enum.map(fn _ -> 1 end) |> :erts_debug.size |> Kernel.*(:erlang.system_info(:wordsize)) |> Kernel./(1024)
    size2 = 1..1000 |> Enum.map(fn _ -> 1 end) |> :erts_debug.size |> Kernel.*(:erlang.system_info(:wordsize)) |> Kernel./(1024)

    Benchee.run(
      %{
        "memory user #{size1}" => fn -> 1..100 |> Enum.map(fn _ -> 1 end) |> :erts_debug.size end,
        "memory user #{size2}" => fn -> 1..1000 |> Enum.map(fn _ -> 1 end) |> :erts_debug.size end
      },
      memory_time: 2
    )

  end
end
