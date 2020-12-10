defmodule FunctionTest do
  use ExUnit.Case
  @moduletag :capture_log

  test "function 1" do
    sum = fn (a, b) -> a + b end
    assert 5 == sum.(2, 3)
  end

  test "function 2" do
    # 利用 &1，&2，&3 来传递参数，以快速构建匿名函数
    sum = &(&1 + &2)
    assert 5 == sum.(2, 3)
  end

  test "function3" do
    # 方法重载
    handle_result = fn
      {:ok, result} ->
            IO.puts("Handling result #{result}}")
            :confirm

      {:error, reason} ->
            IO.puts("handling error, #{reason}")
            :cancel

    end
    assert :confirm == handle_result.({:ok, 123})
  end


  def hi(name) do
    "Hello, " <> name
  end

  def hi(name), do: "Hi, " <> name
  # 重复定义并不会产生编译错误，会按顺序匹配

  test "func test" do
    assert hi("Sean") == "Hello, Sean"
  end


  def of([]), do: 0
  def of([_ | tail]), do: 1 + of(tail)

  test "test length" do
    assert of([]) == 0
    assert of([1,2,3,4]) == 4
  end

  def hello(), do: "Hello, anonymous person!"
  def hello(name), do: "Hello, " <> name
  def hello(name1, name2), do: "Hello, #{name1} and #{name2}"

  test "func test 2" do
    assert "Hello, anonymous person!" == hello()
    assert "Hello, qpm" == hello("qpm")
    assert "Hello, qpm and abc" == hello("qpm", "abc")
  end

  def helloPerson(%{name: person_name}) do
    "Hello, " <> person_name
  end

  def helloPerson(%{age: person_name}) do
    "Hello, " <> person_name
  end

  test "func test 3" do
    fred = %{
    name: "Fred",
    age: 95
    }
    assert "Hello, Fred" = helloPerson(fred)
  end


#  私有函数

  defp phrase(name), do: "Hello " <> name

  test "func private function" do
    assert "Hello qpm" == phrase("qpm")
  end

  # 哨兵子句

  def helloGays(names) when is_list(names) do
    names
    |> Enum.join(",")
  end

  test "test fun when" do
    assert "1,2,3,4" = helloGays([1,2,3,4])
  end

  # 默认参数

  def getByLanguageCode(name, language_code \\ "en") do
    change(language_code) <> name
  end

  def change("en"), do: "Hello, "
  def change("es"), do: "Hola, "


  test "test for language code" do
    assert getByLanguageCode("qpm") == "Hello, qpm"
  end





end
