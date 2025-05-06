# Numbers

3 # integer
0xFF # integer written in hex
3.14 # float
1.0e-2 # exponential notation of float

# The division operator always returns float
4/2
# 2.0
div(5, 2) # division with integer result
# 2

rem(5, 2) # calculate division remainder

1_000_000 # you can use "_" as visual delimeter

# There is no upper limit on an integer's size
9999999999999999999999999999999999999999999999999999999999999999999999999999



# Atoms

# Atoms are literally named constants. They’re similar to symbols in Ruby.
:an_atom
:"an atom with spaces"

# An atom consists of two parts: the text and the value.
# The atom text is whatever you put
# after the colon character. At run time, this text is kept in the atom table. The value is
# the data that goes into the variable, and it’s merely a reference to the atom table.

# You can omit the beginning colon and start with an uppercase character
AnAtom # this is called "alias"

# When you use an alias, the compiler implicitly adds the "Elixir." prefix to its text
AnAtom == Elixir.AnAtom



# Boolean
# Elixir doesn’t have a dedicated Boolean type. Instead, the atoms :true and :false are used.
:true == true
:false == false

true and false
# false

false or true
# true

not false
# true



# nil
# Another special atom is :nil
# The atoms nil and false are treated as falsy values, whereas everything else is treated as a truthy value.
# This property can be used with Elixir’s short-circuit operators ||, &&, and !. The operator || returns the first expression that isn’t falsy:
nil || false || 5 || true
# 5



# tuples
person = {"Bob", 25}
elem(person, 1)
# 25
put_elem(person, 1, 26)
# The function put_elem doesn’t modify the tuple. It returns the new version, keeping the old one intact.
# person var still holds unmodified version {"Bob", 25}
# Tuples are most appropriate for grouping a small, fixed number of elements together.



# Lists
# In Erlang, lists are used to manage dynamic, variable-sized collections of data.
prime_numbers = [2, 3, 5, 7]
# Lists may look like arrays, but they work like singly linked lists.
Enum.at(prime_numbers, 3)
# 7

5 in prime_numbers
# true
4 in prime_numbers
# false

[1, 2, 3] ++ [4, 5] # concatenates lists
# [1, 2, 3, 4, 5]

# Recursive lists definition
# A list is (head, tail) pair where head is the first
# element of the list and tail “points” to the (head,
# tail) pair of the remaining elements
# In Elixir, there’s a special syntax to support recursive list definition:
a_list = [head | tail]

# empty list as tail indicates the end of entire list
[1 | []]
# [1]
[1 | [2 | []]]
# [1, 2]

hd([1, 2, 3, 4]) # function to get head of a list
tl([1, 2, 3, 4]) # function to get tail of a list

# For the sake of completeness, it should be mentioned that the tail
# doesn’t need to be a list. It can be any type. When the tail isn’t a list, it’s said that
# the list is improper, and most of the standard list manipulations won’t work.
# Improper lists have some special uses.
a_list = [5, :value, true]
new_list = [:new_element | a_list]
# Construction of the new_list is an O(1) operation, and no memory copying occurs—
# the tail of the new_list is the a_list.


# maps
# A map is a key–value store
empty_map = %{}
squares = %{1 => 1, 2 => 4, 3 => 9}
squares = Map.new([{1, 1}, {2, 4}, {3, 9}])
squares[2]
# 4
squares[4]
# nil
Map.get(squares, 2)
# 4
Map.get(squares, 4, :not_found)
# :not_found
Map.fetch(squares, 2)
# {:ok, 4}
Map.fetch(squares, 4)
# :error
Map.fetch!(squares, 4)
# ** (KeyError) key 4 not found in: %{1 => 1, 2 => 4, 3 => 9}
# (stdlib) :maps.get(4, %{1 => 1, 2 => 4, 3 => 9})
squares = Map.put(squares, 4, 16)



# structured data
bob = %{:name => "Bob", :age => 25, :works_at => "Initech"}
# OR
bob = %{name: "Bob", age: 25, works_at: "Initech"}
bob[:works_at]
# "Initech"

#OR
bob.age
# 25

bob.non_existent_field
# ** (KeyError) key :non_existent_field not found

next_years_bob = %{bob | age: 26} # change age field



# binaries and bitstrings
# A binary is a chunk of bytes.
<<1, 2, 3>> # create a 3 byte binary
<<256>>
# <<0>>
<<257>>
# <<1>>
<<257::16>> # You can specify the size of each value and, thus, tell the compiler how many bits to use for that particular value
# <<1, 1>>
<<1::4, 15::4>>
# <<31>>
<<1, 2>> <> <<3, 4>> # <> operator concatenates 2 bitstrings



# strings
# Elixir doesn’t have a dedicated string type.

# binary strings
a_str = "This is a string"
"Embedded expression: #{3 + 0.14}"
"
This is
a multiline string
"
~s(This is also a string) # sigil syntax for declaring a string
# There’s also an uppercase version ~S that doesn’t handle interpolation or escape characters (\)
~S(Not interpolated #{3 + 0.14})
# "Not interpolated \#{3 + 0.14}"
"""
Heredoc must end on its own line """
"""

"String" <> " " <> "concatenation" # because strings are binaries, you can concatenate them with the <> operator

# character lists
# A character list (also called a charlist) is a list in which each element is an integer code point of the corresponding character.
IO.puts([65, 66, 67])
# ABC
IO.puts(~c"ABC") # ~c sigil syntax of charlists
IO.puts('ABC') # single quote syntax

# since IO.puts('ABC') the ~c is recommended method
# Character lists aren’t compatible with binary strings.



# first-class functions
square = fn x ->
  x * x
end

square.(5) # the "." operator is needed for such function call
fn x -> IO.puts(x) end # can be replaced with &IO.puts/1 syntax
lambda = &(&1 * &2 + &3) # short lambda syntax
# This snippet creates a three-arity lambda. Each argument is referred to via the &n placeholder, which identifies the nth argument of the function



# closures
# lambda can reference any var from outside scope
outside_var = 5
my_lambda = fn ->
  IO.puts(outside_var)
end

# A closure always captures a specific memory location. Rebinding of a var has no effect.
outside_var = 5
lambda = fn -> IO.puts(outside_var) end
outside_var = 6
lambda.()
# 5


# range
range = 1..2
2 in range
# true
-1 in range
# false
Enum.each(
  1..3,
  &IO.puts/1
)
# 1
# 2
# 3



# keyword list
# A keyword list is a special case of a list, where each element is a two-element tuple, and
# the first element of each tuple is an atom. The second element can be of any type.
days = [{:monday, 1}, {:tuesday, 2}, {:wednesday, 3}]
days = [monday: 1, tuesday: 2, wednesday: 3] # shorter syntax
IO.inspect([100, 200, 300], [width: 3])
IO.inspect([100, 200, 300], width: 3, limit: 1) # you can ommit []
# It is possible to simulate optional arguments. You can accept a keyword list as the last argument of your
# function and make that argument default to an empty list:
def my_fun(arg1, arg2, opts \\ []) do
  # ...
end



# MapSet
# A MapSet is the implementation of a set—a store of unique values.
days = MapSet.new([:monday, :tuesday, :wednesday])



# Times and dates
# types for working with date/time are Date, Time, DateTime, and NaiveDateTime.
date = ~D[2023-01-31] # ~D sigil for creating a date
date.year
# 2023
date.day
# 31

time = ~T[11:59:12.00007] # ~T sigil for creating time

naive_datetime = ~N[2023-01-31 11:59:12.000007]
utc_datetime = ~U[2023-01-31 11:59:12.000007Z]
utc_datetime.time_zone
# "Etc/UTC"



# macros
