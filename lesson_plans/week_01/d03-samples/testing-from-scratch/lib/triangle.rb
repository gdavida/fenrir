require 'pry'

# Determines if the given leg-lengths can make a real triangle
#
# + a: integer for the first length
# + b: integer for the second length
# + c: integer for third length
#
# returns true if they're a real triangle, false otherwise
def validate_triangle(a, b, c)
  a + b > c && b + c > a && a + c > b
end

# binding.pry
