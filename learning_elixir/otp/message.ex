defmodule Spawn1 do
  import :timer, only: [sleep: 1]

  def greet do
    receive do
      {sender, msg} ->
        send(sender, {:ok, "Hello, #{msg}"})
    end
  end

  def sad_function do
    sleep(500)
    exit(:boom)
  end

  def run do
    spawn_link(Spawn1, :sad_function, [])

    receive do
      msg ->
        IO.puts("MESSAGE RECEIVED: #{inspect(msg)}")
    after
      1000 ->
        IO.puts("Nothing happened as far as I am concerned")
    end
  end

  def run do
    spawn(Spawn1, :sad_function, [])

    receive do
      msg ->
        IO.puts("MESSAGE RECEIVED: #{inspect(msg)}")
    after
      1000 ->
        IO.puts("Nothing happened as far as I am concerned")
    end
  end
end

# pid = spawn(Spawn1, :greet, [])
# send(pid, {self(), "World!"})

# receive do
#   {:ok, message} ->
#     IO.puts(message)
# end
