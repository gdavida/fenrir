require_relative "test_helper"
require_relative "../lib/bear.rb"

class BearTest < Minitest::Test

  def test_can_be_created_under_normal_circumstances
    bear = Bear.new(name: "Yogi", age: 78, height: "9-3", humans_eaten: 0)
    refute_nil(bear)
  end

  def test_name_getter
    bear = Bear.new(name: "Yogi", age: 78, height: "9-3", humans_eaten: 0)
    assert_equal("Yogi", bear.name)
  end

  def test_age_getter
    bear = Bear.new(name: "Yogi", age: 78, height: "9-3", humans_eaten: 0)
    assert_equal(78, bear.age)
  end

  def test_height_getter
    bear = Bear.new(name: "Yogi", age: 78, height: "9-3", humans_eaten: 0)
    assert_equal("9-3", bear.height)
  end

  def test_age_setter_with_valid_age
    bear = Bear.new(name: "Yogi", age: 78, height: "9-3", humans_eaten: 0)
    
    bear.age = 81
    assert_equal(81, bear.age)
  end

  def test_age_setter_with_zero_age
    bear = Bear.new(name: "Yogi", age: 78, height: "9-3", humans_eaten: 0)
    
    bear.age = 0
    refute_equal(0, bear.age)
  end

  def test_age_setter_with_negative_age
    bear = Bear.new(name: "Yogi", age: 78, height: "9-3", humans_eaten: 0)
    
    bear.age = -73
    refute_equal(-73, bear.age)
  end
  
  def test_humans_eaten_getter
    bear = Bear.new(name: "Yogi", age: 78, height: "9-3", humans_eaten: 17)
    assert_equal(17, bear.humans_eaten)
  end

  def test_eat_another_human
    bear = Bear.new(name: "Yogi", age: 78, height: "9-3", humans_eaten: 17)
    
    bear.eat_another_human
    assert_equal(18, bear.humans_eaten)
  end

  def test_humans_eaten_setter
    bear = Bear.new(name: "Yogi", age: 78, height: "9-3", humans_eaten: 17)
    
    bear.humans_eaten = 0
    assert_equal(0, bear.humans_eaten)
  end

  def test_creating_without_farm
    bear = Bear.new(name: "Yogi", age: 78, height: "9-3", humans_eaten: 17)

    assert_nil(bear.farm)
  end

  def test_giving_a_bear_a_farm
    bear = Bear.new(name: "Yogi", age: 78, height: "9-3", humans_eaten: 17)
    farm = Farm.new(acres: 22, crop: "bananas", planted: true, harvest_method: "hand")

    # Expect the bear to have no farm
    assert_nil(bear.farm)
    
    # Give the bear a farm
    bear.farm=farm
    
    # Expect the bear to NOT have no farm
    refute_nil(bear.farm)
  end
end
