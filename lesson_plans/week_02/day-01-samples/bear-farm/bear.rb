class Bear
  
  def initialize(options={})
    @name = options[:name]
    @age = options[:age]
    @height = options[:height]
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end

  def age
    @age
  end

  def age=(new_age)
    @age = new_age if new_age >= 1
  end

  def height
    @height
  end

  def height=(new_height)
    @height = new_height
  end

  def eat_some_food(food="delicious snacks")
    "#{@name} ate some #{food}"
  end
end
