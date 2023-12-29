defmodule SpawnBasic do
  def greet do
    IO.puts("Hello")
  end

  def test do
    processId = self()
    IO.puts("Process id: #{inspect(processId)}")
    spawn(fn -> send(processId, {:hello, "Message sent and received"}) end)

    receive do
      {:hello, msg} -> IO.puts(msg)
    end
  end
end
