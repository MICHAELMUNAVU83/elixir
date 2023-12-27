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
