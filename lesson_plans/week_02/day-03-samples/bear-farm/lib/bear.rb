require "pry"
require_relative "farm.rb"

class Bear
  attr_accessor :name, :age, :height, :humans_eaten

  def initialize(name:, age:, height:, humans_eaten:)
    @name = name
    @age = age
    @height = height
    @humans_eaten = humans_eaten
    @farm = nil 
  end

  def farm
    @farm
  end

  def itself
    self
  end

  def plant_farm
    farm.plant
  end

  def farm=(farm)
    @farm = farm
    farm.bear = self
  end

  def age=(new_age)
    @age = new_age if new_age >= 1
  end
  
  def eat_another_human
    @humans_eaten += 1
  end
  
  def eat_some_food(food="delicious snacks")
    "#{@name} ate some #{food}"
  end
end

binding.pry
