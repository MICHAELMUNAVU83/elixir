## Elixir Language

Elixir is a functional language with immutable state

### Difference with OOP and FP

In OOP , we hide data in Classes , objects and we worry about not changing state , In Elixir , We want to transform data from one form to another , we don't care about state , we care about data transformation .

### Functional Programming

In Elixir , everything is broken down into functions , the smaller , the better they are to reuse and they can all run in parallel .

### Installing Elixir

[`Installing Elixir`](http://elixir-lang.org/install.html)

### IEX - Interactive Elixir

Go to your Shell terminal and run

```sh
iex
```

#### IEX Helpers

To get all of them inside iex run

```sh
h
```

The most popular ones are

```sh
i - information about data types
h - help
v - history
c - compile
r - reload
```

We use h to get help on elixir functions , eg `IO.puts`
If you run `h IO.puts` , you will get

````sh

Writes item to the given device, similar to write/2, but adds a newline at the
end.

     ```sh
    IO.puts("Hello World!")
    #=> Hello World!

    IO.puts(:stderr, "error")
    #=> error
    ```

    ```
````
