defmodule Crashy do
  def run do
    Process.flag(:trap_exit, true)
    spawn_link(Crashy, :splode, [])

    receive do
      {signal, pid, msg} ->
        IO.inspect signal
        IO.inspect pid
        IO.inspect msg
    end
  end

  def splode do
    exit :kaboom
  end
end
