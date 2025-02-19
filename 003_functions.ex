# A function must always be a part of a module. Function names follow the same con-
# ventions as variables: they start with a lowercase letter or underscore character and are
# followed by a combination of alphanumerics and underscores.

# The return value of a function is the return value of its last expression.
# There’s no explicit return in Elixir.

defmodule Geometry do
  def rectangle_area(a, b) do
    a * b
  end
end

IO.puts Geometry.rectangle_area(6, 7)

# Parentheses are optional
IO.puts Geometry.rectangle_area 2, 3

# If a function body consists of a single expression, you can use a condensed form and
# define it in a single line:
#   defmodule Geometry do
#     def rectangle_area(a, b), do: a * b
#   end

# Pipe operator
-5
|> abs()
|> Integer.to_string()
|> IO.puts()

# Arity describes the number of arguments a function receives.
# A function is uniquely identified by its containing module, name, and arity.
# Geometry.rectangle_area/2 - /2 is arity.
# Two functions with the same name but different arities are two different functions.

defmodule Calculator do
  def add(a), do: add(a, 0) # arity 1
  def add(a, b), do: a + b # arity 2
end

# \\ allows to specify argument's default value
defmodule Calculator2 do
  def add(a, b \\ 0), do: a + b # arg b by default is 0
end

# Default values generate multiple functions of the same name
# with different arities.
# Because arity distinguishes multiple functions of the same name, it’s not possible to
# have a function accept a variable number of arguments.

# When you define a function using the def macro, the function is made public—it can
# be called by anyone else. In Elixir terminology, it’s said that the function is exported. You
# can also use the defp macro to make the function private. A private function can be used
# only inside the module it’s defined in.

# You can import that other module into your own.
# The standard library’s Kernel module is automatically imported into every module.
defmodule MyModule do
  import IO #  <==================
  def my_function do
    puts "Calling imported function."
  end
end

# alias makes it possible to reference a module under a different name
defmodule MyModule2 do
  alias IO, as: MyIO
  # alias Geometry.Rectangle, as: Rectangle  <-- common use-case (to shorten the module name
  # alias Geometry.Rectangle <-- you can skip as: part if alias matches the last part of imported module name
  def my_function do
    MyIO.puts("Calling imported function.")
  end
end
