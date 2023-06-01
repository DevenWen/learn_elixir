defmodule Memory.StorageLocalityTest do
  use ExUnit.Case
  doctest Memory.StorageLocality
  alias Memory.StorageLocality

  # 编写一个 benchee 的测试，测试 good 和 bad 方法的性能差异

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
end
