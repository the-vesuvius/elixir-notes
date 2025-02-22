defmodule Circle do
  @pi 3.14159       # <-------
  def area(r), do: r*r*@pi
  def circumference(r), do: 2*r*@pi
end

# The important thing about the @pi constant is that it exists only during the compi-
# lation of the module, when the references to it are inlined.
# An attribute can be registered, which means it will be stored in the gen-
# erated binary and can be accessed at run time.
