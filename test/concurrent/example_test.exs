defmodule Concurrent.ExampleTest do
  use ExUnit.Case

  alias Concurrent.Example
  alias Concurrent.ExampleV2
  alias Concurrent.ExampleV3

  @moduletag :capture_log

  doctest Example

  test "module exists" do
    assert is_list(Example.module_info())
  end

  test "test spawn" do
    # 创建进程并运算
    spawn(Example, :add, [2, 3])
  end

  test "test and timer" do
    # 测量数据
    {cost, _} = :timer.tc(Example, :add, [2, 3])
    IO.puts("cost: #{cost}")
  end


  test "test and timer 2" do
    # 测量数据
    {cost, _} = :timer.tc(fn -> for _ <- 1..10000000 do
                                  Example.add(2, 3)
                                end
    end)
    # 1428165 1000W 1.4s
    IO.puts("cost: #{cost}")
  end

  test "test and timer 3" do
    # 测量数据
    {cost, _} = :timer.tc(fn -> for _ <- 1..10000000 do
                                  spawn(Example, :add, [2, 3])
                                end
    end)
    # 15765804 1000W 15s CPU 500%
    IO.puts("cost: #{cost}")
  end


  test "proccess and message" do
    pid = spawn(ExampleV2, :listen, [])
    send pid, {:ok, "hello"}
  end

  test "proccess and spwan_link" do
    # 两个链接起来的进程能收到相互的退出通知
    ExampleV3.run()
  end

  test "process and spwan_monitor" do
    Concurrent.ExampleV4.run()
  end


  test "test Agent" do
    # Agent 是后台运行的可以保存状态进程的抽象，我们可以在应用和节点中的进程中获取它的状态。Agent 的状态被设置成函数的返回值
    {:ok, agent} = Agent.start_link(fn -> [1, 2, 3] end)
    Agent.update(agent, fn(state) -> state ++ [4,5] end)
    result = Agent.get(agent, &(&1))
    assert result == [1,2,3,4,5]
  end


  test "test Task" do
    x = 10
    task = Task.async(fn ->
      :timer.sleep(2000)
      x * 2
    end)
    IO.puts("other worldDone")
    result = Task.await(task)
    assert result == 20
  end

end
