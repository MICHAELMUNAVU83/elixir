## Elixir Language

Elixir is a functional language with immutable state

### Difference with OOP and FP

In OOP , we hide data in Classes , objects and we worry about not changing state , In Elixir , We want to transform data from one form to another , we don't care about state , we care about data transformation .

### Functional Programming

In Elixir , everything is broken down into functions , the smaller , the better they are to reuse and they can all run in parallel .

### Installing Elixir

[`Installing Elixir Documentation`](http://elixir-lang.org/install.html)

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

```sh

Writes item to the given device, similar to write/2, but adds a newline at the
end.


    IO.puts("Hello World!")
    #=> Hello World!

    IO.puts(:stderr, "error")
    #=> error



```

### Compiling And Running Elixir

We can have elixir code in source files , here, you will note they either end with .ex or .exs , files ending in .ex are intended to be compiled into
bytecodes and then run, whereas those ending in .exs are more like programs
in scripting languages , tests also end in .exs as we dont need to keep compiled versions of tests .

#### First Program

Create a folder called learning_elixir and inside it another function called hello_world .
Inside hello_world , create a file called hello.exs and inside it .

```sh
mkdir learning_elixir
cd learning_elixir
mkdir hello_world
cd hello_world
touch hello.exs
code .
```

```

```

Inside the file , write

```sh

IO.puts "Hello World"

```

Now to run this , we can run

```sh
elixir hello.exs
```

### Pattern Matching

#### Variables

Let us look at `a = 2 ` , in this case ,
the left-hand side is a variable and the right-hand side is an
integer literal,

= is the symbol the match operator

#### Lists

Lists are created by using squared brackets , seperating the elements by commas , think of them as arrays

```sh
[1,2,3]
```

Pattern matching for lists looks like

````sh

iex> list = [1, 2, 3]
[1, 2, 3]
iex> [a, b, c ] = list
[1, 2, 3]
iex> a
1
iex> b
2
iex> c
3

```

````

#### Ignoring A Value with the underscore

If we didn’t need to capture a value during the match, we could use the special
variable \_ (an underscore)'

```sh

iex> ["a", _, _] = ["a", "b", "c"]
["a", "b", "c"]

```

#### Variables Bind Once (per Match)

Once a variable has been bound to a value in the matching process, it keeps
that value for the remainder of the match.

For example if we have

```sh

[b, b] = [1,3]
```

We will get an error as b cannot have 2 values

### Immutabilty

#### What is Immutability

Immutability means that data cannot be altered once created. In Elixir, functions are designed to take some data as input and return a new version of that data as output, without changing the original data.

Such that we have

```sh
iex> name = "elixir"
"elixir"
iex> cap_name = String.capitalize name
"Elixir"
iex> name
"elixir"
```

## Elixir Built In Types

Elixir’s built-in types are
• Value types:
– Arbitrary-sized integers
– Floating-point numbers
– Atoms
– Ranges
– Regular expressions
• System types:
– PIDs and ports
– References
• Collection types:
– Tuples
– Lists
– Maps
– Binaries

### Value Types

These represent numbers , ranges , names and regular expressions

#### Integers

Integer literals can be written as decimal (1234), hexadecimal (0xcafe), octal
(0o765), and binary (0b1010).

#### Floating-Point Numbers

Floating-point numbers are written using a decimal point.

#### Atoms

Atoms are constants that represent something’s name. An atom’s name is its value . They have a colon (:) in front of them

```sh

:teamlead , :name , :age


```

#### Ranges

Ranges are represented as start..end, where start and end are integers.

#### Regular Expressions (Regex)

Regular expressions are represented as ~r{regex} or ~r{regex}opts where
regex is the regular expression and opts are regular expression options.

Examples

```sh
iex> Regex.run ~r{[aeiou]}, "caterpillar"
["a"]

```

### System Types

These reflect the underlying resources in the Erlang VM .

#### PIDs and Ports

PID is a process ID and a reference to a local process while ports are references to resources outside the Erlang VM.

### Collection Types

Elixir collections can hold values of any type

#### Tuples

Tuples are ordered collection of values , You write a tuple between braces, separating the elements with commas.

{1 , 2}

#### Lists

Lists may look like arrays in other languages but tuples in elixir are closest to what we may call arrays .
A list is a linked data structure , they have a head and a tail .

Examples

```sh
iex> [1,2 ,3]
[ 1,2 ,3]

```

#### Keyword Lists

Here we have key pair values , we have a value represented by a key , this can be written in 2 ways .

```sh
iex> [ name: "Dave", city: "Dallas", likes: "Programming" ]
 [ name: "Dave", city: "Dallas", likes: "Programming" ]


 iex> [ {:name, "Dave"}, {:city, "Dallas"}, {:likes, "Programming"} ]
 [ name: "Dave", city: "Dallas", likes: "Programming" ]

```
