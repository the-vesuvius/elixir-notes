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
