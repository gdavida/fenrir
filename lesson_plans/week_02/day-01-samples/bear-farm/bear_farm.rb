require "pry"

# We want to know:
# + The general state of our bears
# + The general state of their farms

# Name - string
# ID - string
# Gender - string "Male" "Female"
# Species - string
# Age - integer
# console-affiliation - string
# Hungry? (hunger levels) - integer

yogi = {
          name: "Yogi",
          id: "B000001",
          gender: "boy",
          species: "Pic-a-nic Basket Eater",
          age: 7,
          console_affiliation: :atari,
          hunger_level: 9
        }


def make_new_bear(name, id, gender, species, age, console_affiliation, hunger_level)
  { 
    name: name,
    id: id,
    gender: gender,
    species: species,
    age: age,
    console_affiliation: console_affiliation,
    hunger_level: hunger_level
  }
end
        
def introduction(options={})
  puts "#{options[:name]} is a #{options[:species]}" 
  puts "#{options[:name]} has a hunger level of #{options[:hunger_level]}"
  puts "#{options[:name]} really likes #{options[:console_affiliation]}"
end

def have_a_birthday(bear={})
  puts "#{bear[:name]} was #{bear[:age]} years old yesterday."
  bear[:age] = bear[:age] + 1
  puts "Today, #{bear[:name]} is #{bear[:age]} years old."
end



binding.pry
