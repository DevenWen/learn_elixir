defmodule ControlTest do
  use ExUnit.Case


  @moduletag :capture_log


  test "if" do
    t = fn () ->
      if String.valid?("Hello") do
        "Valid string"
      else
        "InValid string"
      end
    end

    assert t.() == "Valid string"
  end

  test "unless" do
    unless is_integer("Hello") do
      :ok
    else
      assert false
    end
  end

  test "case" do
    value = {:ok, "Hello"}
    case value do
      {:ok, value} ->
        assert value == "Hello"
      {:error, reason} ->
        assert false
      _ ->
        assert false

    end
  end


  test "case when" do
    # case + 哨兵
    value = {:money, 1000}
    case value do
      {:money, value} when value > 0 ->
        IO.puts("ok, I got #{value}")
        assert 1000 == value
    end
  end

  test "cond" do
    # cond
    cond do
      2 + 2 == 5 ->
        IO.puts("This will not be true")
      2 * 2 == 3 ->
        IO.puts("Nor this")
      1 + 1 == 2 ->
        IO.puts("But this will")
    end
  end

end
