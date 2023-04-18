defmodule Memory.StorageLocality do

  # 编写一个局部性差的函数, 用来测试局部性
  def bad do
    1..100_000
    |> Enum.map(fn _ -> :rand.uniform(100_000) end)
    |> Enum.map(fn x -> x + 1 end)
    |> Enum.sum()
  end

  # 编写一个局部性好的函数
  def good do
    1..100_000
    |> Enum.map(fn _ -> :rand.uniform(100_000) end)
    |> Enum.map(fn x -> x + 1 end)
    |> Enum.sum()
  end

end
