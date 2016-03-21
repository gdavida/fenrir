require 'pry'

# Default Values
def say_hello(name)
  "Hello, #{name}!"
end

def greet_multiple(names)
  names.each do |name|
    "Hello, #{name}!"
  end
end

def print_date(month, day, year)
  "#{month}-#{day}-#{year}"
end


binding.pry
