defmodule ModuleDemo.User do
  @moduledoc false

  alias Demo.Greetings

  # @derive 关键字，可以让 User 结构体只暴露 name 字段
  @derive {Inspect, only: [:name]}

  # 处理对象
  defstruct name: "Sean", roles: []

  def greeting(name), do: Greetings.morning(name)

end
