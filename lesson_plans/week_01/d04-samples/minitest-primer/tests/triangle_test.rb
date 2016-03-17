require_relative "../lib/triangle.rb"
require_relative "test_helper.rb"

class TriangleTest < Minitest::Test

  # Add our first test soon

  def test_if_5_5_5_is_valid
    result = validate_triangle(5, 5, 5)
    assert(result, "5, 5, 5 should be valid")
  end

  def test_if_5_6_12_is_invalid
    result = validate_triangle(5, 6, 12)
    assert(result == false, "5, 6, 12 should be invalid")
  end
end
