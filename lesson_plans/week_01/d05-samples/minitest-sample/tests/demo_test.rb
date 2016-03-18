require_relative "test_helper.rb"

class DemoTest < Minitest::Test

  ## ASSERT
  def test_assert_in_affirmative_case
    # result = valid_date?(1, 2, 2015)
    result = true
    assert(result, "should be true")
  end

  def test_assert_in_failing_case
    # This one is going to fail
    skip
    result = false
    assert(result, "Should be true")
  end

  ## REFUTE
  def test_refute_in_passing_case
    # passes if result is false
    result = false
    refute(result, "should be false")
  end

  def test_refute_in_failing_case
    # This should fail
    skip
    result = true
    refute(result, "should be false")
  end

  ## SKIP
  def test_actually_a_placeholder
    skip
    result = true
    assert(result, "we shouldn't actually get here")
  end

  ## ASSERT_EQUAL(expected_value, actual_value)
  
  def test_assert_equal_passing
    result = 2 + 2
    assert_equal(4, result)
  end

  def test_assert_equal_failing
    skip
    result = 2 + 2
    assert_equal(5, result)
  end

  ## REFUTE_EQUAL(expected, actual)

  def test_refute_equal_passing
    result = 2 + 2
    refute_equal(5, result)
  end

  def test_refute_equal_failing
    skip
    result = 2 + 2
    refute_equal(4, result)
  end

  ## ASSERT_NIL( value )
  
  def test_assert_nil_passing
    arr = [1, 2, 3]
    result = arr[99]
    assert_nil(result)
  end

  def test_assert_nil_failing
    skip
    arr = [1, 2, 3]
    result = arr[1]
    assert_nil(result)
  end

  ## ASSERT_INCLUDES(collection, object)
  # assert(collection.include?(obj))
  
  def test_includes_passing
    arr = [1, 2, 3]
    assert_includes(arr, 2)
  end

  ## ASSERT_RESPOND_TO(obj, :method_name)

  def test_respond_to_passing
    str = "abc"
    assert_respond_to(str, :upcase)
  end

end
