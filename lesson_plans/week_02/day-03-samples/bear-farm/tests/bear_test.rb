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
    bear.acquires_farm(farm)
    
    # Expect the bear to NOT have no farm
    refute_nil(bear.farm)
  end

  # If a bear disowns a farm, then farm should disown the bear -- DISSOLUTION
  def test_bears_disowning_farms
    bear = Bear.new(name: "Yogi", age: 78, height: "9-3", humans_eaten: 17)
    
    farm = Farm.new(acres: 22, crop: "bananas", planted: true, 
                    harvest_method: "hand")
    
    bear.acquires_farm(farm)
    assert_equal(farm, bear.farm)

    bear.disowns_farm

    assert_nil(bear.farm)
    assert_nil(farm.bear)
  end

  # If a bear with a farm is assigned to another farm, the old farm should
  #   disown the bear and the new farm and bear should be assigned to each other
  
  def test_bear_with_farm_getting_a_different_farm
    # SETUP
    # Make a bear and a farm
    # Assign the farm to the bear
    # Make a new farm (attached to no bear)
    bear = Bear.new(name: "Yogi", age: 78, height: "9-3", humans_eaten: 17)
    
    old_farm = Farm.new(acres: 22, crop: "bananas", planted: true, 
                    harvest_method: "hand")
    
    bear.acquires_farm(old_farm)
    assert_equal(old_farm, bear.farm)
    
    new_farm = Farm.new(acres: 35, crop: "apples", planted: true, 
                        harvest_method: "hand")
    
    # OPERATION
    # Re-assign the bear to the new farm
    bear.acquires_farm(new_farm)

    # ASSERTIONS
    # Old farm should not be attached to the bear
    refute_equal(bear, old_farm.bear)

    # Bear should not be attached to the old farm
    refute_equal(old_farm, bear.farm)

    # Bear should be attached to new farm
    assert_equal(new_farm, bear.farm)

    # New farm should be attached to the bear
    assert_equal(bear, new_farm.bear)
  end

  # If a bear with no farm is assigned a farm with a bear, the operation fails

  def test_bear_acquires_farm_owned_by_another_bear
    bear = Bear.new(name: "Yogi", age: 78, height: "9-3", humans_eaten: 17)
    
    farm = Farm.new(acres: 22, crop: "bananas", planted: true, 
                    harvest_method: "hand")
    
    bear.acquires_farm(farm)
    assert_equal(farm, bear.farm)

    other_bear = Bear.new(name: "Booboo", age: 78, height: "9-3", humans_eaten: 17)
    
    # This operation should not allow other_bear to own farm
    other_bear.acquires_farm(farm)
    
    # New bear should not own farm
    refute_equal(farm, other_bear.farm)
    
    #Old bear should still own farm
    assert_equal(farm, bear.farm)

    #Farm should still be owned by old_bear
    assert_equal(bear, farm.bear)
  end

end
