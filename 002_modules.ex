# A module is a collection of functions, somewhat like a namespace. Every Elixir function
# must be defined inside a module.
# To call a function of a module you use the syntax
# ModuleName.function_name(args).

defmodule Geometry do
  def rectangle_area(a, b) do
    a * b
  end
end

IO.puts Geometry.rectangle_area(6, 7)
