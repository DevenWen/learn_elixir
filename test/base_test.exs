defmodule BaseTest do
  use ExUnit.Case
  doctest Base

  @moduledoc false

  test "math" do
    5 = 2+3
    assert 2+3 == 5
    assert String.length("The") == 3
    assert 6 == 0b0110

  end

end
