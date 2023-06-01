defmodule Memory.StorageLocalityTest do
  use ExUnit.Case
  doctest Memory.StorageLocality
  alias Memory.StorageLocality

  describe "good/0" do
    test "returns the sum of 100,000 random numbers between 1 and 100,000, plus 100,000" do
      result = StorageLocality.good()
      assert result >= 100_100_000 and result <= 200_100_000
    end

    test "returns the same result when called multiple times" do
      result1 = StorageLocality.good()
      result2 = StorageLocality.good()
      assert result1 == result2
    end
  end
end
