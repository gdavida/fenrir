require 'pry'

# Default Values
#
# say_hello("Art")
def say_hello(name, other_name="Human")
  puts "Hello, #{name}!"
end

def greet_multiple(*names)
  p names

  names.each do |name|
    puts "Hello, #{name}!"
  end
end

def print_date(options={})
  month = options[:month]
  day = options[:day]
  year = options[:year]

  puts "#{month}-#{day}-#{year}"

  puts "month: #{month}, day: #{day}, year: #{year}"
end


binding.pry
