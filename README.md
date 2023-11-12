## Elixir Language

Elixir is a functional language with immutable state

## BASICS

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

#### Maps

A map is a collection of key value pairs and it looksas such

%{ key => value, key => value }

You can have them such as

```sh
iex> colors = %{ :red => 0xff0000, :green => 0x00ff00, :blue => 0x0000ff }
%{blue: 255, green: 65280, red: 16711680}


```

##### Accessing A Map

You can extract the value of each map with its key , the square bracket syntax works .

You have map["value"]

```sh
iex> colors = %{ :red => 0xff0000, :green => 0x00ff00, :blue => 0x0000ff }
%{blue: 255, green: 65280, red: 16711680}

iex> colors[:red]
16711680

```

If the keys are atoms, you can also use a dot notation:

```sh
iex> colors = %{ :red => 0xff0000, :green => 0x00ff00, :blue => 0x0000ff }
%{blue: 255, green: 65280, red: 16711680}

iex> colors.red
16711680

```

#### Binaries

Used when you need to access data as a sequence of bits and bytes .
Elixir supports this with a binary data type enclosed between << >>

```sh
iex> bin = << 1, 2 >>
<<1, 2>>
iex> byte_size bin
2

```

### Dates and Times

Elixir 1.5 has a Calender module , it represents the rules used to manipulate dates

```sh
iex> d1 = Date.new(2018, 12, 25)
{:ok, ~D[2018-12-25]}
```

The Time type contains an hour, a minute, a second, and fractions of a second.

```sh
iex> {:ok, t1} = Time.new(12, 34, 56)
{:ok, ~T[12:34:56]}
```

There are two date/time types: DateTime and NaiveDateTime. The naive version
contains just a date and a time; DateTime adds the ability to associate a time
zone.

### Names, Source Files, Conventions, Operators

Identifiers in elixir start with a letter or an underscore followed by letters , digits or underscores .

Module, record, protocol, and behavior names start with an uppercase letter
and are BumpyCase. All other identifiers start with a lowercase letter or an
underscore, and by convention use underscores between words.

#### Truth

Elixir has three special values related to Boolean operations: true, false, and
nil.
In most context , any value other than false or nil is treated as true .

#### Operators

Can be broken down into

##### Comparison operators

```sh
a === b # strict equality (so 1 === 1.0 is false)
a !== b # strict inequality (so 1 !== 1.0 is true)
a == b # value equality (so 1 == 1.0 is true)
a != b # value inequality (so 1 != 1.0 is false)
a > b # normal comparison
a >= b # :
a < b # :
a <= b # :
```

##### Boolean Operators

These operators expect true or false as their first argument

```sh
a or b # true if a is true; otherwise b
a and b # false if a is false; otherwise b
not a # false if a is true; true otherwise
```

##### Relaxed Boolean Operators

Here ,Any value apart from nil or
false is interpreted as true

```sh
a || b # a if a is truthy; otherwise b
a && b # b if a is truthy; otherwise a
!a # false if a is truthy; otherwise true
```

##### Arithmetic Operators

- - - / div rem
      Integer division yields a floating-point result. Use div(a,b) to get an integer.

      for div , the format is div(dividen , divisor) , same as that for rem

```sh
iex> 20/2
10.0
iex> div(20,2)
10
iex> rem(20,2)
0


```

##### Join operators

binary1 <> binary2 # concatenates strings and binaries

list1 ++ list2 # concatenates two lists
list1 -- list2 # removes elements of list 2 from a copy of list 1

Examples

```sh
iex(17)> <<1, 2>> <> << 2, 3>>
<<1, 2, 2, 3>>
iex(18)> [1 ,2] ++ [3,4]
[1, 2, 3, 4]
iex(19)> [1 ,2] -- [4]
[1, 2]
iex(20)> [1 ,2] -- [2]
[1]
iex(21)>
```

##### in operator

The in operator , checks if a value is in a list , returns true or false .

a in enum

```sh
iex(21)> 2  in [2,3,4]
true
iex(22)> 3 in [1,2]
false
iex(23)>
```

#### Variable Scope

Elixir is lexically scoped. The basic unit of scoping is the function body.
Variables defined in a function (including its parameters) are local to that
function.

#### Do Block Scope

In elixir , we can group functions with the do block

```sh

line_no = 50
# ...
if (line_no == 50) do
IO.puts "new-page\f"
line_no = 0
end


```

#### The With Expression

The with expression allows you to define a local
scope for variables. If you need a couple of temporary variables when calculating something, and you don’t want those variables to leak out into the
wider scope . It also gives you some control over pattern-matching
failures.
Used as 'with' and 'do ' so

with `correct match` do `something`

```sh

iex> person = %{age: 70, first_name: "Bill", last_name: "Murray"}

iex> with {:ok, first_name} <- Map.fetch(person, :first_name),
...>      {:ok, last_name} <- Map.fetch(person, :last_name) do
...>   "#{first_name} #{last_name}"
...> end
"Bill Murray"



```

## FUNCTIONS

### Anonymous Functions

This is created using the `fn` keyword .

It has a parameter list and a body , seperated by ->

```sh
iex> sum = fn (a, b) -> a + b end
#Function<12.17052888 in :erl_eval.expr/5>
iex> sum.(1, 2)
3
````
