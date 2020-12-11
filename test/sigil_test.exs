defmodule SigilTest do
  use ExUnit.Case
  @moduletag :capture_log

  # Sigil 是一种语法糖，用于表示和处理字面量。
  # Sigil 以 ~ 开头，然后接上一个字符
  # Elixir 内置了一些 Sigil

  doctest MySigils

  test "c & C" do
    assert '2 + 7 = 9' = ~c/2 + 7 = #{2 + 7}/
    assert '2 + 7 = \#{2 + 7}' = ~C/2 + 7 = #{2 + 7}/
  end

  # 正则表达式

  test "r & R" do
    re = ~r/elixir/
    assert !("Elixir" =~ re)
    # todo "=~" 是什么符号？正则表达式的特定符号么？
    assert "elixir" =~ re


    # i 关闭正则表达式
    re = ~r/elixir/i
    assert "ELIXIR" =~ re
    assert "elixir" =~ re
  end

  test "r & R 2" do
    string = "100_000_000"
    assert ["100", "000", "000"] = Regex.split(~r/_/, string)
  end

  test "w & W" do
    # 处理单词
    string = "i love u"
    assert ["i", "love", "u"] = ~w/#{string}/
    assert ["string"] = ~W/string/
  end

  test "N" do
    assert NaiveDateTime.from_iso8601("2020-12-11 00:00:00") == {:ok, ~N[2020-12-11 00:00:00]}
  end

  test "U" do
    assert DateTime.from_iso8601("2015-01-23 23:50:07Z") == {:ok, ~U[2015-01-23 23:50:07Z], 0}
  end

  import MySigils

  @doc """
  测试 my sigil
  """
  test "my sigil" do
    assert "ELIXIR SCHOOL" == ~p/elixir school/
  end

end

