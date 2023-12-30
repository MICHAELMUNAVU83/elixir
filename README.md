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

We can force Elixir to use the existing value of the variable
in the pattern? Prefix it with ^ (a caret). In Elixir, we call this the pin operator.

```sh
iex(41)> a = 1
1
iex(42)> a = 2
2
iex(43)> ^a = 1
** (MatchError) no match of right hand side value: 1
    (stdlib 5.0.2) erl_eval.erl:498: :erl_eval.expr/6
    iex:43: (file)
iex(43)> ^a = 2
2
iex(44)>
```

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
```

Notice how we call the anonymous function. The dot indicates the function call, and the arguments are passed between
parentheses. (You’ll have noticed we don’t use a dot for named function
calls—this is a difference between named and anonymous functions.)

If your function takes no arguments, you still need the parentheses to call it:

```sh
iex> greet = fn -> IO.puts "Hello" end
#Function<12.17052888 in :erl_eval.expr/5>
iex> greet.()
Hello
:ok

```

#### Pattern Matching

In elixir , we don't do assignments , `a = 2` , we do not assign `2` to `a` , however , we are matching `2` with `a`.
Elixir tries to match values to patterns and binds a key to a value .

```sh

iex> swap = fn { a, b } -> { b, a } end
#Function<12.17052888 in :erl_eval.expr/5>
iex> swap.( { 6, 8 } )
{8, 6}
```

#### One Function multiple bodies

We can use pattern matching to select which clause to run when a function has many bodies

```sh
my_function = fn
  0  -> "Zero"
  x when rem(x, 2) == 0 -> "Even"
  x -> "Odd"
end

IO.puts my_function.(0)    # Output: "Zero"
IO.puts my_function.(4)    # Output: "Even"
IO.puts my_function.(7)    # Output: "Odd"
```

Write a function that takes three arguments. If the first two are zero,
return “FizzBuzz.” If the first is zero, return “Fizz.” If the second is zero,
return “Buzz.”

```sh
my_function = fn
  0 , 0 , x  -> "Fizzbuzz"
  0, x, x -> "Fizz"
  x, 0,x  -> "Odd"
end

```

#### Functions Can Return Functions

```sh
fun1 = fn ->
fn ->
"Hello"
end
end


```

To get "Hello" in this case , we have to call it as such .

```sh
iex> fun1.().()
"Hello"
```

#### Passing functions as parameters

Functions return values so we can pass them as parameters .

```sh
#Function<12.17052888 in :erl_eval.expr/5>
iex> apply = fn (fun, value) -> fun.(value) end
#Function<12.17052888 in :erl_eval.expr/5>
iex> apply.(times_2, 6)
12
```

Here, apply is a function that takes a second function and a value. It returns
the result of invoking that second function with the value as an argument.

#### Pinned Values and Function Parameters

When we originally looked at pattern matching, we saw that the pin operator
(^) allowed us to use the current value of a variable in a pattern. You can use
this with function parameters, too.

```sh
check_same = fn
  a, ^a -> "Both parameters are the same: #{a}"
  a, b -> "Parameters are different: #{a} and #{b}"
end

IO.puts check_same.(3, 3)  # Output: "Both parameters are the same: 3"
IO.puts check_same.(2, 4)  # Output: "Parameters are different: 2 and 4"

```

#### The & Notation

The strategy of creating short helper functions is so common that Elixir provides a shortcut

The & operator converts the expression that follows into a function. Inside
that expression, the placeholders &1, &2, and so on correspond to the first,
second, and subsequent parameters of the function. So `&(&1 + &2)` will be
converted to `fn p1, p2 -> p1 + p2` end.

```sh

iex> add_one = &(&1 + 1) # same as add_one = fn (n) -> n + 1 end
#Function<6.17052888 in :erl_eval.expr/5>
iex> add_one.(44)
45
```

The & capture operator works with string (and string-like) literals:

```sh
iex> s = &"bacon and #{&1}"
#Function<6.99386804/1 in :erl_eval.expr/5>
iex> s.("custard")
"bacon and custard"

```

### Modules and Named Functions

Modules are a way of grouping certain functions .

```sh
defmodule Times do
  def double(n) do
   n * 2
  end
end
```

#### Compiling a module

```sh
defmodule Times do
  def double(n) do
   n * 2
  end
end


```

If this is inside timex.ex , to call this function we run

```sh
$ iex times.exs
iex> Times.double(4)
8
```

Give IEx a source file’s name, and it compiles and loads the file before it displays a prompt .
If you’re already in IEx, you can use the c helper to compile your file without
returning to the command line.

```sh
iex> c "times.exs"
[Times]
iex> Times.double(4)
8
iex> Times.double(123)
246
The line c "times.exs" compiles your source file and loads it into IEx
```

#### Function Calls and Pattern Matching

We can have a function of the same name do different things depending on the parameter passed because of pattern matching as such .

```sh
defmodule Factorial do
  def of(0), do: 1
  def of(n), do: n * of(n-1)
end

```

If we run this we get

```sh
iex> Factorial.of(3)
6
iex> Factorial.of(7)
5040
iex> Factorial.of(0)
1
```

#### Guard Clauses

These are used when we need to distinguish functions based on the argument types or some external test .

```sh
defmodule Guard do
def what_is(x) when is_number(x) do
IO.puts "#{x} is a number"
end
def what_is(x) when is_list(x) do
IO.puts "#{inspect(x)} is a list"
end
def what_is(x) when is_atom(x) do
IO.puts "#{x} is an atom"
end
end
Guard.what_is(99) # => 99 is a number
Guard.what_is(:cat) # => cat is an atom
Guard.what_is([1,2,3]) # => [1,2,3] is a list
```

##### Guard Clause Limitations

###### Comparison operators

==, !=, ===, !==, >, <, <=, >=

###### Boolean and negation operators

or, and, not, !. Note that || and && are not allowed.

###### Arithmetic operators

+, -, \*, /

###### Join operators

<> and ++, as long as the left side is a literal

###### The in operator

Membership in a collection or range

###### Type-check functions

These built-in Erlang functions return true if their argument is a given
type. You can find their documentation online.2
is_atom is_binary is_bitstring is_boolean is_exception is_float
is_function is_integer is_list is_map is_number is_pid
is_port is_record is_reference is_tuple

#### Default Parameters

When you define a named function, you can give a default value to any of its
parameters by using the syntax param \\ value.

```sh
defmodule Example do
def func(p1, p2 \\ 2, p3 \\ 3, p4) do
IO.inspect [p1, p2, p3, p4]
end
end

Example.func("a", "b") # => ["a",2,3,"b"]
Example.func("a", "b", "c") # => ["a","b",3,"c"]
Example.func("a", "b", "c", "d") # => ["a","b","c","d"]

```

#### Private Functions

The defp macro defines a private function—one that can be called only within
the module that declares it.

#### The Pipe Operator

The |> operator takes the result of the expression to its left and inserts it as
the first parameter of the function invocation to its right.

```sh

 def test do
    (2 + 2)
    |> (fn x -> x * x end).()
 end

```

#### Modules

Modules provide namespaces for things you define. We’ve already seen them
encapsulating named functions. They also act as wrappers for macros, structs,
protocols, and other modules.

##### The import Directive

The import directive brings a module’s functions and/or macros into the current
scope.

The syntax is
`import Module [, only:|except: ] `

##### The alias Directive

The alias directive creates an alias for a module

The syntax is
`alias Module , as: ModuleName`

##### The require Directive

You require a module if you want to use any macros it defines. This ensures
that the macro definitions are available when your code is compiled

#### Module Attributes

Elixir modules each have associated metadata. Each item of metadata is
called an attribute of the module and is identified by a name. Inside a module,
you can access these attributes by prefixing the name with an at sign (@)

Think of it as a variable that can be accessed in that module

```sh
 defmodule Example do
@author "Dave Thomas"
def get_author do
@author
end
end
IO.puts "Example was written by #{Example.get_author}"
```

You can set the same attribute multiple times in a module

```sh
defmodule Example do
@attr "one"
def first, do: @attr
@attr "two"
def second, do: @attr
end
IO.puts "#{Example.second} #{Example.first}" # => two one
```

## Lists and Recursion

### Heads and Tails

A list can either be empty or have a tail and a head . The
head contains a value and the tail is itself a list

```sh
iex> [a, b, c ] = [ 1, 2, 3 ]
[1, 2, 3]
iex> a
1
iex> b
2
iex> c
3
```

We can also use the pipe character in the pattern. What’s to the left of it
matches the head value of the list, and what’s to the right matches the tail.

```sh
iex> [ head | tail ] = [ 1, 2, 3 ]
[1, 2, 3]
iex> head
1
iex> tail
[2, 3]
```

## Maps , Keyword Lists, Sets, and Structs

How to Choose Between Maps, Structs, and Keyword Lists
Ask yourself these questions (in this order):
• Do I want to pattern-match against the contents (for example, matching
a dictionary that has a key of :name somewhere in it)?
If so, use a map.
• Will I want more than one entry with the same key?
If so, you’ll have to use the Keyword module.
• Do I need to guarantee the elements are ordered?
If so, again, use the Keyword module.
• Do I have a fixed set of fields (that is, is the structure of the data always
the same)?
If so, use a struct.
• Otherwise, if you’ve reached this point,

Use a map.

### Keyword Lists

A keyword list is a list that consists exclusively of two-element tuples.

The first element of these tuples is known as the _key_, and it must be an
atom. The second element, known as the _value_, can be any term.
For example, the following is a keyword list:

```````sh

    [{:exit_on_close, true}, {:active, :once}, {:packet_size, 1024}]

    ``````
```````

### Maps

Maps can be created with the %{} syntax, and key-value pairs can be expressed
as key => value:

```````sh
    iex> %{}
    %{}
    iex> %{"one" => :two, 3 => "four"}
    %{3 => "four", "one" => :two}
``````
```````

#### Pattern Matching And Updating Maps

The question we most often ask of our maps is, “Do you have the following keys (and maybe values)?” For example, given this map:

```sh
person = %{ name: "Dave", height: 1.88 }

```

• Is there an entry with the key :name?

```sh
iex> %{ name: a*name } = person %{height: 1.88, name: "Dave"} iex> a_name
"Dave"
```

• Are there entries for the keys :name and :height?

```sh
iex> %{ name: \*, height: _ } = person
%{height: 1.88, name: "Dave"}
```

• Does the entry with key :name have the value "Dave"?

```sh
iex> %{ name: "Dave" } = person
%{height: 1.88, name: "Dave"}
```

Our map does not have the key :weight, so the following pattern match fails:

```sh
 iex> %{ name: \_, weight: \_ } = person
\*\* (MatchError) no match of right hand side value: %{height: 1.88, name: "Dave"}

```

#### Pattern Matching Can’t Bind Keys

You can’t bind a value to a key during pattern matching. You can write this:

```sh
iex> %{ 2 => state } = %{ 1 => :ok, 2 => :error } %{1 => :ok, 2 => :error}
iex> state
:error
```

but not this:

```sh
iex> %{ item => :ok } = %{ 1 => :ok, 2 => :error }
\*\* (CompileError) iex:5: illegal use of variable item in map key

```

#### Updating A Map

Maps let us add new key/value entries and update existing entries without traversing the whole structure. But as with all values in Elixir, a map is immutable, and so the result of the update is a new map.
The simplest way to update a map is with this syntax:

new_map = %{ old_map | key => value, ... }

This creates a new map that is a copy of the old, but the values associated
with the keys on the right of the pipe character are updated

```sh
iex> m = %{ a: 1, b: 2, c: 3 }
%{a: 1, b: 2, c: 3}
iex> m1 = %{ m | b: "two", c: "three" } %{a: 1, b: "two", c: "three"}
iex> m2 = %{ m1 | a: "one" }
%{a: "one", b: "two", c: "three"}
```

### Structs

Structs are maps with a predefined set of keys. They’re useful when you want
to guarantee that a map has a specific set of keys, and when you want to
attach a name to a map.

They are a typed data structure , they have a name and a set of keys .

```sh
defmodule Subscriber do
   defstruct name: "", paid: false, over_18: true
end
```

Here , this is a struct called Subscriber , it has 3 keys , name , paid and over_18

```sh

$ iex defstruct.exs
iex> s1 = %Subscriber{}
%Subscriber{name: "", over_18: true, paid: false}
 iex> s2 = %Subscriber{ name: "Dave" }
 %Subscriber{name: "Dave", over_18: true, paid: false}
 iex> s3 = %Subscriber{ name: "Mary", paid: true }
 %Subscriber{name: "Mary", over_18: true, paid: true}
 iex> s4 = %Subscriber{test: "Testing"}
    (KeyError) key :test not found
    expanding struct: Subscriber.__struct__/1
    iex:3: (file)
```

The syntax for creating a struct is the same as the syntax for creating a map—you simply add the module name between the % and the {.
You access the fields in a struct using dot notation or pattern matching:

```sh
iex> s3.name
"Mary"
iex> %Subscriber{name: a_name} = s3 %Subscriber{name: "Mary", over_18: true, paid: true}
iex> a_name
"Mary"
```

```sh
defmodule Attendee do
defstruct name: "", paid: false, over_18: true
def may_attend_after_party(attendee = %Attendee{}) do attendee.paid && attendee.over_18
end
def print_vip_badge(%Attendee{name: name}) when name != "" do IO.puts "Very cheap badge for #{name}"
end
def print_vip_badge(%Attendee{}) do raise "missing name for badge"
end
end

$ iex defstruct1.exs
iex> a1 = %Attendee{name: "Dave", over_18: true} %Attendee{name: "Dave", over_18: true, paid: false} iex> Attendee.may_attend_after_party(a1)
false
iex> a2 = %Attendee{a1 | paid: true} %Attendee{name: "Dave", over_18: true, paid: true} iex> Attendee.may_attend_after_party(a2)
true
iex> Attendee.print_vip_badge(a2)
Very cheap badge for Dave
:ok
iex> a3 = %Attendee{}
%Attendee{name: "", over_18: true, paid: false} iex> Attendee.print_vip_badge(a3)
** (RuntimeError) missing name for badge

```

#### Nested Accessors and Nonstructs

If you are using the nested accessor functions with maps or keyword lists, you can supply the keys as atoms:

```sh
iex> report = %{ owner: %{ name: "Dave", company: "Pragmatic" }, severity: 1}
 %{owner: %{company: "Pragmatic", name: "Dave"}, severity: 1}
iex> put_in(report[:owner][:company], "PragProg")
%{owner: %{company: "PragProg", name: "Dave"}, severity: 1}
iex> update_in(report[:owner][:name], &("Mr. " <> &1))
%{owner: %{company: "Pragmatic", name: "Mr. Dave"}, severity: 1}
```

If we look at at the these macros , we have , get_in , put_in and update_in and get_and_update_in

```sh
nested = %{ buttercup: %{
actor: %{
first: "Robin", last: "Wright"
},
      role: "princess"
},
westley: %{
actor: %{
first: "Cary", last: "Elwes"
},
      role: "farm boy"
} }

IO.inspect get_in(nested, [:buttercup])
# => %{actor: %{first: "Robin", last: "Wright"}, role: "princess"}
IO.inspect get_in(nested, [:buttercup, :actor]) # => %{first: "Robin", last: "Wright"}
IO.inspect get_in(nested, [:buttercup, :actor, :first]) # => "Robin"
IO.inspect put_in(nested, [:westley, :actor, :last], "Elwes")
# => %{buttercup: %{actor: %{first: "Robin", last: "Wright"}, role: "princess"}, # => westley: %{actor: %{first: "Cary", last: "Elwes"}, role: "farm boy"}}

```

### The Access Module

The Access module provides a number of predefined functions to use as parameters to get and get_and_update_in. These functions act as simple filters while traversing the structures.
The all and at functions only work on lists. all returns all elements in the list, while at returns the nth element (counting from zero).

```sh
cast = [ %{
character: "Buttercup", actor: %{
first: "Robin",
last: "Wright"
},
role: "princess"
}, %{
character: "Westley", actor: %{
first: "Cary",
last: "Elwes"
},
role: "farm boy"
} ]

IO.inspect get_in(cast, [Access.all(), :character]) #=> ["Buttercup", "Westley"]
IO.inspect get_in(cast, [Access.at(1), :role]) #=> "farm boy"

```

The elem function works on tuples:

```sh
cast = %{
buttercup: {
actor: {"Robin", "Wright"},
role: "princess"
},
westley: %{
actor: {"Carey", "Elwes"},

role : "farm boy"
}
}

IO.inspect get_in(cast, [Access.key(:westley), :actor, Access.elem(1)]) #=> "Elwes"
```

Access.pop lets you remove the entry with a given key from a map or keyword list. It returns a tuple containing the value associated with the key and the updated container. nil is returned for the value if the key isn’t in the container.

The name has nothing to do with the pop stack operation.

```sh
iex> Access.pop(%{name: "Elixir", creator: "Valim"}, :name)
 {"Elixir", %{creator: "Valim"}}
iex> Access.pop([name: "Elixir", creator: "Valim"], :name)
 {"Elixir", [creator: "Valim"]}
iex> Access.pop(%{name: "Elixir", creator: "Valim"}, :year)
{nil, %{creator: "Valim", name: "Elixir"}}

```

#### Sets

A set is a data structure that can contain unique elements of any kind, without
any particular order. MapSet is the "go to" set data structure in Elixir.

A set can be constructed using MapSet.new/0:

```````sh

    iex> MapSet.new()
    MapSet.new([])

    ```

Elements in a set don't have to be of the same type and they can be populated
from an enumerable (t:Enumerable.t/0) using MapSet.new/1:
```sh

    iex> MapSet.new([1, :two, {"three"}])
    MapSet.new([1, :two, {"three"}])
    ``````

Elements can be inserted using MapSet.put/2:


    iex> MapSet.new([2]) |> MapSet.put(4) |> MapSet.put(0)
    MapSet.new([0, 2, 4])

```````

<!--
Have Enums and Streams here -->

### Strings and Binaries

Elixir has two kinds of string: single-quoted and double-quoted. They differ significantly in their internal representation. But they also have many things in common.

#### Sigils

Sigils
Like Ruby, Elixir has an alternative syntax for some literals. We’ve already seen it with regular expressions, where we wrote ~r{...}. In Elixir, these ~-style literals are called sigils (symbols with magical powers)

The letter determines the sigil’s type:
~C A character list with no escaping or interpolation
~c A character list, escaped and interpolated just like a single-quoted string ~D A Date in the format yyyy-mm-dd
~N A naive (raw) DateTime in the format yyyy-mm-dd hh:mm:ss[.ddd]
~R A regular expression with no escaping or interpolation
~r A regular expression, escaped and interpolated
~S A string with no escaping or interpolation
~s A string, escaped and interpolated just like a double-quoted string
~T A Time in the format hh:mm:ss[.dddd]
~W A list of whitespace-delimited words, with no escaping or interpolation ~w A list of whitespace-delimited words, with escaping and interpolation

#### Breaking Down strings

Before we get further into this, I need to explain something. In most other languages, you’d call both 'cat' and "cat" strings. And that’s what I’ve been doing so far. But Elixir has a different convention.
In Elixir, the convention is that we call only double-quoted strings “strings.” The single-quoted form is a character list.
This is important. The single- and double-quoted forms are very different, and libraries that work on strings work only on the double-quoted form.

#### Single-Quoted Strings—Lists of Character Codes

Single-quoted strings are represented as a list of integer values, each value corresponding to a codepoint in the string. For this reason, we refer to them as character lists (or char lists).

```sh
iex> str = 'wombat' 'wombat'
iex> is_list str true
iex> length str
6
iex> [67,65,84]
~c"CAT"
```

#### Binaries

The binary type represents a sequence of bits. A binary literal looks like << term,... >>.
The simplest term is just a number from 0 to 255. The numbers are stored as successive bytes in the binary.

```sh
iex> b = << 1, 2, 3 >> <<1, 2, 3>>
iex> byte_size b
3
```

#### Double-Quoted Strings Are Binaries

Whereas single-quoted strings are stored as char lists, the contents of a double-quoted string (dqs) are stored as a consecutive sequence of bytes in UTF-8 encoding. Clearly this is more efficient in terms of memory and certain forms of access, but it does have two implications.

#### Strings and Elixir Libraries

When Elixir library documentation uses the word string (and most of the time it uses the word binary), it means double-quoted strings.
The String module defines functions that work with double-quoted strings

## Control Flow

### if and unless

In Elixir, if and its evil twin, unless, take two parameters: a condition and a keyword list, which can contain the keys do: and else:. If the condition is truthy, the if expression evaluates the code associated with the do: key; otherwise it evaluates the else: code. The else: branch may be absent.

```sh
iex> if 1 == 1, do: "true part", else: "false part" "true part"
iex> if 1 == 2, do: "true part", else: "false part" "false part"
```

```sh
iex> unless 1 == 1, do: "error", else: "OK" "OK"
iex> unless 1 == 2, do: "OK", else: "error" "OK"
```

### case

case lets you test a value against a set of patterns, executes the code associated with the first pattern that matches, and returns the value of that code. The patterns may include guard clauses.

```sh

x = 10

    case x do
      0 ->
        "This clause won't match"


        10 ->
        "X is 10"

      _ ->
        "This clause would not match any value (x = #{x})"
    end


```

### cond

When we need to match conditions rather than values we can turn to cond/1

```sh
cond do
  2 + 2 == 5 ->
    "This will not be true"
  2 * 2 == 3 ->
    "Nor this"
  1 + 1 == 2 ->
    "But this will"
end
"But this will"
```

### Raising Exception

Elixir exceptions are intended for things that should never happen in normal operation.

```sh

iex> raise "Giving up"
** (RuntimeError) Giving up

```

<!--
read about logger -->

## Tooling

### Debugging

The most straightforward tool we have for debugging Elixir code is IEx.

But don’t be fooled by its simplicity - you can solve most of the issues with your application by i

You get the interactive shell in the context of the place you want to debug.

Let’s try it.

To do that, create a file named test.exs and put this into the file:

```sh
defmodule TestMod do
  def sum([a, b]) do
    b = 0

    a + b
  end
end

IO.puts(TestMod.sum([34, 65]))
```

And if you run it - you’ll get an apparent output of 34

```sh
$ elixir test.exs
warning: variable "b" is unused (if the variable is not meant to be used, prefix it with an underscore)
  test.exs:2

34




```

<!-- Read about debugging and breakpoints -->

### Basic Testing

If we have such a module

```sh
defmodule Stats do
def sum(vals), do: vals |> Enum.reduce(0, &+/2) def count(vals), do: vals |> length
def average(vals), do: sum(vals) / count(vals)
end
```

Our tests might look something like this:

```sh
defmodule TestStats do use ExUnit.Case
test "calculates sum" do
list = [1, 3, 5, 7, 9] assert Stats.sum(list) == 25
end
test "calculates count" do
list = [1, 3, 5, 7, 9]
assert Stats.count(list) == 5
end
test "calculates average" do
list = [1, 3, 5, 7, 9]
assert Stats.average(list) == 5
end end
```

#### Test Coverage

Here , we add the dependancy
{:excoveralls, "~> 0.5.5", only: :test}

Now when we run

```
mix coveralls

```

We get the test coverage

## CONCURRENT PROGRAMMING AND PROCESSES

Elixir’s key features is the idea of packaging code into small chunks
that can be run independently and concurrently .

Elixir uses the actor model of concurrency. An actor is an independent process
that shares nothing with any other process. You can spawn new processes,
send them messages, and receive messages back

### A Simple Process

#### Spawning A New Process

Let us define this module

```sh
defmodule SpawnBasic do
def greet do
IO.puts "Hello"
end
end




```

When we run this through iex and call SpawnBasic.greet , we get the output

```sh

iex> SpawnBasic.greet
Hello
:ok

```

Now let’s run it in a separate process:

```sh
iex> spawn(SpawnBasic, :greet, [])
Hello
#PID<0.42.0>
```

The spawn function kicks off a new process and it returns a process identifier, normally called a PID. This uniquely identifies the process it creates

#### Sending Messages Between Processes

In Elixir we send a message using the send function. It takes a PID and the
message to send (an Elixir value, which we also call a term) on the right
We wait for messages using receive
Inside the block associated with the
receive call, you can specify any number of patterns and associated actions.
Just as with case, the action associated with the first pattern that matches
the function is run

This operation is done using the send function and the receive do operator.

```sh

processId = self()
spawn fn -> send(processId, {:hello, "Message sent and received"}) end
receive do
  {:hello, msg} -> IO.puts msg
end

```

In this way , the flow is you spawn , send , then receive.

#### When Processes Die

Who gets told when a process dies? By default, no one. Obviously the VM
knows and can report it to the console, but your code will be oblivious unless
you explicitly tell Elixir you want to get involved

We can have this

```sh
 def sad_function do
    sleep(500)
    exit(:boom)
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
```

When we call the run function , we get

```sh
Nothing happened as far as I am concerned
```

The top level got no notification when the spawned process exited

### Linking Processes

When processes are linked, each can receive information when the other exits.
Linking processes together is more like binding them together in a death pact. The pact says that if one process dies, all the processes linked to it will also die.
The two function primitives for linking processes are spawn_link/1,3 and Process.link/1. The former takes arguments to launch a new process and link to it at the same time, while the latter accepts a PID to perfrom the link.

Starting with spawn_link, we can use it in the run function we used above and observe its behaviour

```sh
def run_linked do
    spawn_link(Spawn1, :sad_function, [])

    receive do
      msg ->
        IO.puts("MESSAGE RECEIVED: #{inspect(msg)}")
    after
      1000 ->
        IO.puts("Nothing happened as far as I am concerned")
    end
  end



```

When we call the run function , we get

```sh
Nothing happened as far as I am concerned
```

Let us look at how we can also structure spawn_link

```sh
iex > pid = spawn_link(fn -> receive do :crash -> 1 / 0 end end)
#PID<0.131.0>

iex > send(pid, :crash)
** (EXIT from #PID<0.118.0>) shell process exited with reason: an exception was raised:
``
```

The anonymous function we provide spawn_link/1 does nothing except wait for a specific message: :crash. All other messages are stored safely in its mailbox, but when a :crash message is sent, it matches against it and attempts to divide 1 by 0, summarily throwing an ArithmeticError exception. The exception kills the process and the linked IEx process with it.

We can use spawn_link/3 as

```sh
iex > defmodule Crashy do
... >   def run do
... >     receive do
... >       :crash -> 1 / 0
... >     end
... >   end
... > end

iex > pid = spawn_link(Crashy, :run, [])
#PID<0.148.0>

iex > send pid, :crash
```

Process.link/1
Unlike spawn_link/1,3, Process.link/1 accepts the PID of an existing process,

```sh
iex > pid = spawn(fn -> receive do :crash -> raise "boom" end end)

iex > Process.link(pid)
true

iex > send pid, :crash
** (EXIT from #PID<0.127.0>) shell process exited with reason: an exception was
raised:
    ** (RuntimeError) boom
        (stdlib) erl_eval.erl:678: :erl_eval.do_apply/6

```

If we were to send :crash to our spawned process, it would raise an exception and die, but our existing IEx process would be fine. If we called Process.link(pid) before sending the :crash message, however, we’ll see output much like what we saw with spawn_link/1,3.

### Trapping Exits

Reference - https://samuelmullen.com/articles/elixir-processes-linking-and-monitoring

When processes are linked, “If [any] process terminates for whatever reason, an exit signal is propagated to all the processes it’s linked to .Elixir allows us to “trap” that exit signal, converting it to a three-tuple message instead.

When trap_exit is set to “true”, exit signals arriving to a process are converted to {'EXIT', From, Reason} messages, which can be received as ordinary messages. If trap_exit is set to “false”, the process exits if it receives an exit signal other than normal and the exit signal is propagated to its linked processes. Application processes are normally not to trap exits.

If we have

```sh
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
```

Now when we run this , we get

```sh
iex > Crashy.run
:EXIT
#PID<0.178.0>
:kaboom

```

Instead of the exception messages we’ve seen so far in our examples, we’re now able to capture the exit signal and do something about it.

### Monitoring Processes

If linking processes is like a couple who’ve grown old together and can’t live without the other, monitoring processes is like reading the obituaries: you know who’s died and you might feel bad about it, but it doesn’t affect you much beyond that.

With the exception of the return values and function name, there’s very little difference between linking to a process and monitoring one. Just replace “link” in spawn_link/1,3 and Process.link with “monitor” and you’re almost done. The real difference between linking and monitoring is how processes handle the death of processes to which they’re connected.

The goal of monitoring processes is to ensure a process knows about the termination of another process

spawn_monitor/1,3
Like its cousin, spawn_link/1,3, spawn_monitor/1,3 is atomic in its execution. Also, like its cousin, it can be called by either passing a function or an MFA. Unlike spawn_link, however, spawn_monitor returns a two-element tuple containing the PID and reference to the spawned process.

```sh
iex > {pid, ref} = spawn_monitor(fn -> receive do :crash -> exit :kaboom end end)
{#PID<0.110.0>, #Reference<0.3864886318.2185232385.215284>}

```

Having spawned and begun monitoring the process, let’s see what happens when the process is killed:

```sh
iex > send(pid, :crash)
:crash

iex > flush
{:DOWN, #Reference<0.3864886318.2185232385.215284>, :process, #PID<0.110.0>,
 :kaboom}
:ok
```

If you were to check the PID of the IEx session before and after, you would see it was the same. spawn_monitor/3 is much the same

```sh
iex > defmodule Crashy do
iex >   def run do
iex >     receive do
iex >       :crash -> exit :kaboom
iex >     end
iex >   end
iex > end

iex > {pid, ref} = spawn_monitor(Crashy, :run, [])
{#PID<0.124.0>, #Reference<0.3864886318.2185232385.215530>}

iex > send(pid, :crash)
:crash

iex > flush
{:DOWN, #Reference<0.3864886318.2185232385.215530>, :process, #PID<0.124.0>,
 :kaboom}
:ok

```

Process.monitor/1
Like Process.link/1, Process.monitor/1 accepts the PID of an existing process. Instead of returning true, however, Process.monitor/1 returns a reference to the monitored process.

```sh
iex > pid = spawn(fn -> receive do :add -> IO.puts 1 + 2 end end)
#PID<0.137.0>

iex > ref = Process.monitor(pid)
#Reference<0.3439345400.1300496390.106497>

iex > send(pid, :add)
3
:add

iex > flush
{:DOWN, #Reference<0.3439345400.1300496390.106497>, :process, #PID<0.137.0>,

 :normal}
:ok

```

<!-- read fibonachi -->

### Nodes

In Elixir, a Node could be defined as a single running instance. There can be multiple nodes running on a single machine.

#### Naming Nodes

We can set the name of a node when we start it. With IEx, use either the --name
or --sname option. The former sets a fully qualified name

## OTP SERVERS

OTP stands for Open Telecom Platform. It is based on Erlang and contains a huge set of libraries from BEAM that follow system design principles. In the core of OTP, we have processes which make Elixir very efficient.

An application
consists of one or more processes. These processes follow one of a small
number of OTP conventions, called behaviors. There is a behavior used for
general-purpose servers, one for implementing event handlers, and one for
finite-state machines.

A special behavior, called supervisor, monitors the health of these processes
and implements strategies for restarting them if needed

Let us build our first OTP server

`mix new sequence`

Create the Basic Sequence Server
Now we’ll create Sequence.Server, our server module. Move into the sequence
directory, and create a subdirectory under lib/ also called sequence.

Add the file server.ex to lib/sequence/:

```sh
defmodule Sequence.Server do
  use GenServer

  def init(initial_number) do
    {:ok, initial_number}
  end

  def handle_call(:next_number, _from, current_number) do
    {:reply, current_number, current_number + 1}
  end
end


```

The use line effectively adds the OTP GenServer behavior to our module

The init function takes some initial value
and uses it to construct the state of the server

When a client calls our server, GenServer invokes its handle_call function. This
function receives three parameters:

1. The information the client passed to the call
2. The PID of the client
3. The server state

When the handle_call function exits, it must return the state (updated or not).

Testing this server , we see

```sh
$ iex -S mix
iex> { :ok, pid } = GenServer.start_link(Sequence.Server, 100)
{:ok,#PID<0.71.0>}
iex> GenServer.call(pid, :next_number)
100
iex> GenServer.call(pid, :next_number)
101
iex> GenServer.call(pid, :next_number)
102
```

The start_link function
behaves like the spawn_link function we used in the previous chapter. It asks
GenServer to start a new process and link to us (so we’ll get notifications if it
fails).

We pass in the module to run as a server: the initial state and we could also pass GenServer options as a third parameter .

GenServer.call/2

                   def call(server, request, timeout \\ 5000)

Makes a synchronous call to the server and waits for its reply.

### One Way Calls

The call function calls a server and waits for a reply. But sometimes you won’t
want to wait because there is no reply coming back. In those circumstances,
use the GenServer cast function. (Think of it as casting your request into the
sea of servers.)

Just like call is passed to handle_call in the server, cast is sent to handle_cast.
Because there’s no response possible, the handle_cast function takes only two
parameters: the call argument and the current state. And because it doesn’t
want to send a reply, it will return the tuple {:noreply, new_state}.

The syntax is as

```sh
def handle_cast(:pop, current_loop) do
  {:noreply, Enum.drop(current_loop, -1)}
end

iex(33)> GenServer.cast(pid, :pop)
:ok

```

### Tracing a Server’s Execution

The third parameter to start_link is a set of options. A useful one during development is the debug trace, which logs message activity to the console.

We enable tracing using the debug option:

```sh
➤ iex> {:ok,pid} = GenServer.start_link(Sequence.Server, 100, [debug: [:trace]])
{:ok,#PID<0.68.0>}

```

```sh

iex(37)> {:ok, pid} = GenServer.start*link(Sequence.Server, [1,2,3],[debug: [:trace]])
{:ok, #PID<0.292.0>}
iex(38)> GenServer.call(pid, :pop)
\_DBG* <0.292.0> got call pop from <0.290.0>
_DBG_ <0.292.0> sent [1,2,3] to <0.290.0>, new state [1,2]

```

See how it traces the incoming call and the response we send back. A nice
touch is that it also shows the next state

We can also include :statistics in the debug list to ask a server to keep some
basic statistics:

```sh
iex(41)> {:ok, pid} = GenServer.start_link(Sequence.Server, [1,2,3],[debug: [:statistics]])
{:ok, #PID<0.294.0>}
iex(42)> GenServer.call(pid, :pop)
[1, 2, 3]
iex(43)> :sys.statistics pid, :get
{:ok,
 [
   start_time: {{2023, 12, 29}, {14, 14, 34}},
   current_time: {{2023, 12, 29}, {14, 14, 58}},
   reductions: 83,
   messages_in: 1,
   messages_out: 1
 ]}
iex(44)>
```

### GenServer Callbacks

When you add the line ‘use GenServer‘ to a module, Elixir creates default
implementations of these six callback functions. All we have to do is override
the ones where we add our own application-specific behavior
Let us look at these

#### init(start_arguments)

Called by GenServer when starting a new server. The parameter is the
second argument passed to start_link. It should return {:ok, state} on success,
or {:stop, reason} if the server could not be started.

#### handle_call(request, from, state)

Invoked when a client uses GenServer.call(pid, request). The from parameter is
a tuple containing the PID of the client and a unique tag. The state
parameter is the server state.
On success it returns {:reply, result, new_state}.

#### handle_cast(request, state)

Called in response to GenServer.cast(pid, request).
A successful response is {:noreply, new_state}. It can also return {:stop, reason,
new_state}.

#### handle_info(info, state)

Called to handle incoming messages that are not call or cast requests.
For example, timeout messages are handled here.

#### terminate(reason, state)

Called when the server is about to be terminated\

#### code_change(from_version, state, extra)

Updates a running server without stopping the system. However, the new
version of the server may represent its state differently from the old version

#### format_status(reason, [pdict, state])

Used to customize the state display of the server. The conventional
response is [data: [{'State', state_info}]].

### Naming A Process

The simplest is local naming. We assign a name that is unique for all OTP
processes on our node, and then we use that name instead of the PID whenever we reference it.

```sh
iex> { :ok, pid } = GenServer.start_link(Sequence.Server, 100, name: :seq)
{:ok,#PID<0.58.0>}
iex> GenServer.call(:seq, :next_number)
100
iex> GenServer.call(:seq, :next_number)
101
iex> :sys.get_status :seq
{:status, #PID<0.69.0>, {:module, :gen_server},
[["$ancestors": [#PID<0.58.0>],
"$initial_call": {Sequence.Server, :init, 1}],
:running, #PID<0.58.0>, [],
[header: 'Status for generic server seq',
data: [{'Status', :running},
{'Parent', #PID<0.58.0>},
{'Logged events', []}],
data: [{'State', "My current state is '102', and I'm happy"}]]]}
```

We can tidy upour code by having a set of two
functions in our server module: start_link and pop_number. The
first of these calls the GenServer start_link method. As we’ll see in the next
chapter, the name start_link is a convention. start_link must return the correct
status values to OTP; as our code simply delegates to the GenServer module,
this is taken care of.

```sh
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

```

When we run this code in IEx, it’s a lot cleaner:

```sh
iex(1)> Sequence.Server.start_link ([1,2,3])
{:ok, #PID<0.135.0>}
iex(2)> Sequence.Server.pop_last
[1, 2, 3]
iex(3)> Sequence.Server.pop_last
[1, 2]
iex(4)> Sequence.Server.pop_first
:ok
iex(5)>
```

### OTP Supervisors

The supervisor is a process that monitors other processes and restarts them if they crash. It’s a key part of the OTP framework, and it’s used to build fault-tolerant systems.
You can write supervisors as separate modules, but the Elixir style is to
include them inline. The easiest way to get started is to create your project
with the --sup flag. Let’s do this for our sequence server.
The only apparent difference is the appearance of the file lib/sequence/application
Looking at this file , we see .

```sh
defmodule Sequence.Application do
# See https://hexdocs.pm/elixir/Application.html
# for more information on OTP Applications
@moduledoc false

use Application

@impl true
def start(_type, _args) do
  children = [
    # Starts a worker by calling: Sequence.Worker.start_link(arg)
    # {Sequence.Worker, arg}
  ]

  # See https://hexdocs.pm/elixir/Supervisor.html
  # for other strategies and supported options
  opts = [strategy: :one_for_one, name: Sequence.Supervisor]
  Supervisor.start_link(children, opts)
end
end

```

Our start function now creates a supervisor for our application. All we need
to do is tell it what we want supervised.

Let us add a new file that contains the previous server code we had written and call it sequence/server.ex

```sh
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

```

Now , we can edit the sequence/application.ex file to have the server as part of its children.

```sh
  children = [
      # Starts a worker by calling: Sequence.Worker.start_link(arg)
      {Sequence.Server, [1, 2, 3]}
    ]
```

Let’s look at what’s going to happen:
• When our application starts, the start function is called.
• It creates a list of child server modules. In our case, there’s just one, the
Sequence.Server. Along with the module name, we specify an argument to
be passed to the server when we start it.
• We call Supervisor.start_link, passing it the list of child specifications and a
set of options. This creates a supervisor process.
• Now our supervisor process calls the start_link function for each of its
managed children. In our case, this is the function in Sequence.Server. This
code is unchanged—it calls GenServer.start_link to create a GenServer process

Now we can try it , what is different this time is that we do not have to start our GenServer manually , once the application starts , the supervisor starts the GenServer

```sh

iex(1)> Sequence.Server.pop_last
[1, 2, 3]
iex(2)> Sequence.Server.pop_last
[1, 2]
iex(3)>



```

The key thing with a supervisor is that it is supposed to
manage our worker process. If it dies, for example, we want it to be restarted.

Let us add a functions that adds half the number passed to the list.

```sh
def add_half(number) do
  GenServer.cast(__MODULE__, {:add_half, number})
end

def handle_cast({:add_half, number}, current_loop) do
  {:noreply, [number / 2 | current_loop]}
end
```

Now if we test this out

```sh
iex(14)> Sequence.Server.add_half(8)
:ok
iex(15)> Sequence.Server.add_half("word")
:ok

15:07:58.475 [error] GenServer Sequence.Server terminating
\*\* (ArithmeticError) bad argument in arithmetic expression
(sequence 0.1.0) lib/server.ex:30: Sequence.Server.handle_cast/2
(stdlib 5.0.2) gen_server.erl:1103: :gen_server.try_handle_cast/3
(stdlib 5.0.2) gen_server.erl:1165: :gen_server.handle_msg/6
(stdlib 5.0.2) proc_lib.erl:241: :proc_lib.init_p_do_apply/3
Last message: {:"$gen_cast", {:add_half, "word"}}
State: [4.0, 1, 2]
iex(16)> Sequence.Server.pop_last
[1, 2, 3]
iex(17)>

```

Now if we run this , we see that the server crashes and the supervisor restarts it and we get the initial state .
The supervisor restarted our sequence
process with the initial parameters we passed in, and the numbers started
again from [1,2,3]. A reincarnated process has no memory of its past lives, and
no state is retained across a crash.

#### Managing A Process Across Restarts

Our server has a state , and after any crash it restarts and the state goes back to its initial setting , we would however prefer having a way of recovering our last stable state before our server crashed and have it restart as such .

All of the approaches to this involve storing the state outside of the process.
Let’s choose a simple option—we’ll write a separate process that can store
and retrieve a value. We’ll call it our stash. The sequence server can store its
current number in the stash whenever it terminates, and then we can recover
the number when we restart.

We will create a stash server , whose function will be to store a single array , our last stable array

/lib/stash.ex

```sh
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

```

Now we want to supervise it. It’ll be running alongside the sequence server:

There are many supervision strategies that elixir has for linked servers in case one of them crashes

##### :one_for_one

if a server dies, the supervisor will restart it. This is the default strategy.

##### :one_for_all

if a server dies, all the remaining servers are first terminated, and then
the servers are all restarted.

##### :rest_for_one

if a server dies, the servers that follow it in the list of children are terminated, and then the dying server and those that were terminated are
restarted.

If we use :one_for_one, a failing
sequence server will restart, and the stash will not be affected. If we use
:rest_for_one, the same thing will happen, but only if the sequence server follows
the stash in the list of children.

Let’s add the stash and update the supervision strategy in our supervisor
startup code

```sh
def start(_type, _args) do
    children = [
      # Starts a worker by calling: Sequence.Worker.start_link(arg)
      {Sequence.Stash, [1, 2, 3]},
      {Sequence.Server, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :rest_for_one, name: Sequence.Supervisor]
    Supervisor.start_link(children, opts)
  end
```

Finally, we need to change our sequence server to use this stash

Handling the sequence server
exiting involves writing another callback, terminate which will update the state of our stash server.

```sh
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

```

### Worker Restart Options

We’ve seen how the supervision strategy tells the supervisor how
to deal with the death of a child process
There’s a second level of configuration that applies to individual workers. The
most commonly used of these is the :restart option.

Previously we said that a supervisor strategy (such as :one_for_all) is invoked
when a worker dies. That’s not strictly true. Instead, the strategy is invoked
when a worker needs restarting. And the conditions when a worker should
be restarted are dictated by its restart: option:

##### :permanent

This worker should always be running—it is permanent. This means that
the supervision strategy will be applied whenever this worker terminates,
for whatever reason.

##### :temporary

This worker should never be restarted, so the supervision strategy is
never applied if this worker dies.

##### :transient

It is expected that this worker will at some point terminate normally, and
this termination should not result in a restart. However, should this worker
die abnormally, then it should be restarted by running the supervision
strategy.

The simplest way to specify the restart option for a worker is in the worker
module. You add it to the use GenServer (or use Supervisor) line:

```sh
defmodule Convolver do
use GenServer, restart: :transient
```

### A COMPLEX EXAMPLE(DESIGNING ELIXIR APPS)

When designing elixir apps , we ask ourselves the following questions.
• What is the environment and what are its constraints?
• What are the obvious focal points?
• What are the runtime characteristics?
• What do I protect from errors?
• How do I get this thing running?

<!--
read about  duper ( 264) -->

## OTP APPLICATIONS

In the OTP world, that’s not the case. Instead, an application is a bundle
of code that comes with a descriptor. That descriptor tells the runtime what
dependencies the code has, what global names it registers, and so on. In fact,
an OTP application is more like a dynamic link library or a shared object than
a conventional application
It might help to see the word application in your head but pronounce it component or service.

### Turning Our Sequence Program into an OTP Application

When mix created the initial project tree, it added a supervisor (which we then modified) and enough information to our mix.exs file to get
the application started.

```sh
 def application do
    [
      extra_applications: [:logger],
      mod: {Sequence.Application, []}
    ]
  end
```

This says that the top-level module of our application is called Sequence. OTP
assumes this module will implement a start function, and it will pass that
function an empty list as a parameter.
In our previous version of the start function, we ignored the arguments and
instead hard-wired the call to start_link to pass [1,2,3] to our application. Let’s
change that to take the value from mix.exs instead.

```sh
 def application do
    [
      extra_applications: [:logger],
      mod: {Sequence.Application, [1, 2, 3]}
    ]
  end
```

Then change the application.ex code to use this passed-in value

```sh
def start(_type, args) do
    children = [
      # Starts a worker by calling: Sequence.Worker.start_link(arg)
      {Sequence.Stash, args},
      {Sequence.Server, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :rest_for_one, name: Sequence.Supervisor]
    Supervisor.start_link(children, opts)
  end
```

Now if we test it out , it works.

The mod: option tells OTP the module that is the main entry point for our app

The registered: option lists the names that our application will register. We can
use this to ensure each name is unique across all loaded applications in a
node or cluster. In our case, the sequence server registers itself under the
name Sequence.Server, so we’ll update the configuration to read as follows




<!-- Read About Distillery -->



