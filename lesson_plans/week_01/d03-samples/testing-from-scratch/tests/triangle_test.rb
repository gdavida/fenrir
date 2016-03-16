require_relative "../lib/triangle.rb"

# This is where we'll put our tests. But how?!

# 5, 6, 12 => false
# 4, 5, 6 => true
# 99, 1, 1 => false
# 0, 0, 0 => false
# 0, 1, 1 => false
# 5, 5, 5 => true
# 5, 4, 2 => true

# Assert produces :) upon a true result, or a message upon a failing result
#
# +
#
# Returns nil, does output

def assert(bool, message)
  if bool
    puts ":)"
  else
    puts message
  end
end

def refute(bool, message)
  if !bool
    puts ":)"
  else
    puts message
  end
end

# FIRST TEST
result = validate_triangle(4, 5, 6)
assert(result, "4, 5, 6 should be a valid triangle")

# SECOND TEST
result = validate_triangle(5, 5, 5)
assert(result, "5,5,5 failed, but should have passed")

# THIRD TEST
result = validate_triangle(5, 6, 12)
refute(result, "5,6,12 passed, but should have failed")

# Fourth Test
result = validate_triangle(12, 6, 5)
refute(result, "12, 6, 5 passed, but should have failed")

# Fifth test
result = validate_triangle(5, 12, 6)
refute(result, "5, 12, 6 passed, but should have failed")


