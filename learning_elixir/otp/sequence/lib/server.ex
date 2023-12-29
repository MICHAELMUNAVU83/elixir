defmodule Sequence.Server do
  use GenServer

  def start_link(current_number) do
    GenServer.start_link(__MODULE__, current_number, name: __MODULE__)
  end

  def pop_last do
    GenServer.call(__MODULE__, :pop_last)
  end

  def pop_first do
    GenServer.cast(__MODULE__, :pop_first)
  end

  # GenServer implementation
  def init(inital_state) do
    {:ok, inital_state}
  end

  def handle_call(:pop_last, _from, current_loop) do
    {:reply, current_loop, Enum.drop(current_loop, -1)}
  end

  def handle_cast(:pop_first, current_loop) do
    {:noreply, Enum.drop(current_loop, 1)}
  end
end
