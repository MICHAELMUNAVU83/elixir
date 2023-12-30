defmodule Sequence.Stash do
  use GenServer

  def start_link(current_loop) do
    GenServer.start_link(__MODULE__, current_loop, name: __MODULE__)
  end

  def get do
    GenServer.call(__MODULE__, :get)
  end

  def update(new_loop) do
    GenServer.cast(__MODULE__, {:update, new_loop})
  end

  # Server implementation
  def init(current_loop) do
    {:ok, current_loop}
  end

  def handle_call(:get, _from, current_loop) do
    {:reply, current_loop, current_loop}
  end

  def handle_cast({:update, new_loop}, _current_number) do
    {:noreply, new_loop}
  end
end
