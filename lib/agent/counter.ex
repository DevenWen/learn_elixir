defmodule Counter do
  use Agent

  def start_link(init \\ 0) do
    Agent.start_link(fn -> init end, name: __MODULE__)
  end

  def increment do
    Agent.update(__MODULE__, fn count -> count + 1 end)
  end

  def get_count do
    Agent.get(__MODULE__, fn count -> count end)
  end
end

# # 启动计数器
# Counter.start_link()

# # 增加计数器
# Counter.increment()

# # 获取计数器的值
# count = Counter.get_count()
# IO.puts("Count: #{count}")
