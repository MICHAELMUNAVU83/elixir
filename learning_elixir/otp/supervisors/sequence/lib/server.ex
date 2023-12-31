defmodule Sequence.Server do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def pop_last do
    GenServer.call(__MODULE__, :pop_last)
  end

  def pop_first do
    GenServer.cast(__MODULE__, :pop_first)
  end

  def add_half(number) do
    GenServer.cast(__MODULE__, {:add_half, number})
  end

  # GenServer implementation
  def init(_initial) do
    {:ok, Sequence.Stash.get()}
  end

  def handle_call(:pop_last, _from, current_loop) do
    {:reply, current_loop, Enum.drop(current_loop, -1)}
  end

  def handle_cast({:add_half, number}, current_loop) do
    {:noreply, [number / 2 | current_loop]}
  end

  def handle_cast(:pop_first, current_loop) do
    {:noreply, Enum.drop(current_loop, 1)}
  end

  def terminate(_reason, current_loop) do
    Sequence.Stash.update(current_loop)
  end
end
