require "pry"

class Bear
  attr_accessor :name, :age, :height

  def initialize(name:, age:, height:)
    @name = name
    @age = age
    @height = height
  end

  def age=(new_age)
    @age = new_age if new_age >= 1
  end
  def eat_some_food(food="delicious snacks")
    "#{@name} ate some #{food}"
  end
end

binding.pry
