defmodule PipelineTest do
  use ExUnit.Case
  @moduletag :capture_log

  # 管道，拿到返回值后，马上又递交给新的函数。
  # 用以往的语言：
  # fun(fun2(fun3())))
  # elixir arg |> fun3 |> fun2 |> fun
  # 编程范式中，控制和逻辑思想分离

  test "Upcase and split" do
    assert ["ELIXIR", "ROCKS"] == "Elixir rocks" |> String.upcase() |> String.split()
  end
end
