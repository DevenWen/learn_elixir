defmodule TimeTest do
  use ExUnit.Case

  test "module exists" do
    assert is_list(Time.module_info())
  end

  test "time 1" do
    t = Time.utc_now()
    IO.puts(t)
  end

  test "time 2" do
    t = ~T[19:39:01]
    assert t.hour == 19
    assert t.minute == 39
    assert t.second == 1
  end

  test "Date" do
    {:ok, date} = Date.new(2020, 12, 11)
    assert date.day == 11
    assert date.month == 12
    assert date.year == 2020
  end
end
