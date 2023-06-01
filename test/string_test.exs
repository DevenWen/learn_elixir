defmodule StringTest do
  use ExUnit.Case

  # Elixir 字符串就是字节序列，而不是字符数据
  test "string 1" do
    string = <<104, 101, 108, 108, 111>>
    assert "hello" == string

    # 单引号 的字符串，就是字符数组
    refute 'hello' == string
    assert 'hello' == [104, 101, 108, 108, 111]
  end

  test "string 寻找字符串 码点" do
    # 字符 1 的码点 是 49
    assert 49 = ?1
  end

  @doc """
  判断 a 和 b 里面的字符构成是否一样
  """
  def anagrams?(a, b) when is_binary(a) and is_binary(b) do
    as = sort_string(a)
    bs = sort_string(b)
    IO.puts(as)
    IO.puts(bs)
    as == bs
  end

  def sort_string(string) do
    string
    |> String.downcase()
    |> String.graphemes()
    |> Enum.sort()
  end

  test "anagrams" do
    str1 = "super"
    str2 = "rsupe"

    assert anagrams?(str1, str2)
    refute anagrams?(str1, str2 <> "0")

    assert_raise FunctionClauseError, fn -> anagrams?(1, 2) end
  end
end
