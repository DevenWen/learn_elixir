defmodule Memory.StorageLocality do
  def good do
    1..100_000
    |> Enum.reduce(0, fn _, acc -> acc + :rand.uniform(100_000) + 1 end)
  end
end
