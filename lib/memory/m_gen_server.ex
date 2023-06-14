# 编写一个 genserver

defmodule Memory.MGenServer do
  use GenServer

  # 实现一个简单的 key-value 存储
  def set(key, value) do
    GenServer.call(__MODULE__, {:set, key, value})
  end

  def get(key) do
    GenServer.call(__MODULE__, {:get, key})
  end

  def delete(key) do
    GenServer.call(__MODULE__, {:delete, key})
  end

  def pass(value) do
    GenServer.call(__MODULE__, {:pass, value})
  end

  def all do
    GenServer.call(__MODULE__, :all)
  end

  def start(thread, size, interval) do
    value = 1..size |> Enum.map(fn x -> x * x end)
    1..thread
    |> Enum.map(fn _ -> spawn(fn -> Stream.interval(interval) |> Enum.each(fn _ -> pass(value) end) end) end)
  end

  def stop(pid) do
    Process.exit(pid, :kill)
  end

  def info() do
    Process.whereis(__MODULE__) |> Process.info()
  end

  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    GenServer.start_link(Memory.MGenServer.Monitor, self())
    {:ok, %{}}
  end

  def handle_call({:set, key, value}, _from, state) do
    {:reply, :ok, Map.put(state, key, value)}
  end

  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end

  def handle_call({:delete, key}, _from, state) do
    {:reply, :ok, Map.delete(state, key)}
  end

  def handle_call({:pass, value}, _from, state) do
    {:reply, value, state}
  end

  def handle_call(:all, _from, state) do
    {:reply, state, state}
  end
end

defmodule Memory.MGenServer.Monitor do

  use GenServer

  # 初始化时，接受一个 pid 作为参数，保存在 state 中
  # 通过定时触发，打印该 pid 进程的 memory 使用情况

  def start_link(pid) do
    GenServer.start_link(__MODULE__, pid, name: __MODULE__)
  end

  def init(pid) do
    Process.send_after(self(), :tick, 1000)
    file = File.open!("memory.log", [:write])
    {:ok, {pid, file}}
  end

  def handle_info(:tick, {pid, file}) do
    {_, memory} = Process.info(pid, :memory)
    process_info = Process.info(pid)

    IO.write(file, "#{inspect DateTime.utc_now()} memory_size: #{memory}\theap_size:#{process_info[:heap_size]}\tminor_gcs:#{process_info[:garbage_collection][:minor_gcs]}\n")
    Process.send_after(self(), :tick, 1000)
    {:noreply, {pid, file}}
  end

end
