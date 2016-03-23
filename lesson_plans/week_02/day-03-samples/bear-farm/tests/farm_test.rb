require_relative "test_helper"
require_relative "../lib/farm.rb"

class FarmTest < Minitest::Test

  def test_should_be_created_under_normal_cirumstances
    farm = Farm.new(acres: 22, crop: "bananas", planted: true, harvest_method: :hand)
    refute_nil(farm)
  end

  def test_acres_getter
    farm = Farm.new(acres: 22, crop: "bananas", planted: true, harvest_method: :hand)
    assert_equal(22, farm.acres)
  end

  def test_farm_should_be_plantable
    farm = Farm.new(acres: 22, crop: "bananas", planted: true, harvest_method: :hand)
    assert_respond_to(farm, :plant)
  end

  def test_planting_an_unplanted_farm
    farm = Farm.new(acres: 22, crop: "bananas", planted: false, harvest_method: :hand)
    result = farm.plant

    assert(farm.planted == true, "Farm should be planted")

    assert_equal("Planted successfully", result)
  end

  def test_planting_an_already_planted_farm
    farm = Farm.new(acres: 22, crop: "bananas", planted: true, harvest_method: :hand)

    result = farm.plant

    assert_equal("Already planted", result)
  end

  def test_harvesting_a_planted_field
    farm = Farm.new(acres: 22, crop: "bananas", planted: true, harvest_method: :hand)

    result = farm.harvest

    refute(farm.planted, "After harvesting, the farm should be unplanted")
    assert_equal("You harvested 22 acres of bananas by hand", result)
  end

  def test_harvesting_an_unplanted_field
    farm = Farm.new(acres: 22, crop: "bananas", planted: false, harvest_method: :hand)

    result = farm.harvest

    refute(farm.planted, "Should still be unplanted")
    assert_equal("You cannot harvest an unplanted field", result)
  end

  def test_assigning_to_a_bear
    farm = Farm.new(acres: 22, crop: "bananas", planted: false, harvest_method: :hand)
    bear = Bear.new(name: "Yogi", age: 78, height: "9-3", humans_eaten: 17)

    bear.acquires_farm(farm)

    assert_equal(farm, bear.farm)

    assert_equal(bear, farm.bear)
  end
end
