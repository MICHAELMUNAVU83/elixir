defmodule App.Example do
  defmacro __using__(opts) do
    quote do
      def hello do
        "Hello, World!"
      end

      # code here will be injected into the module that uses this macro
    end
  end
end

defmodule App do
  use App.Example

  def hello do
    hello()
  end
end
