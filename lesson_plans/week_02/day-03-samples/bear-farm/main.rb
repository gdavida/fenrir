require "pry"
require_relative "lib/bear.rb"
require_relative "lib/farm.rb"

def build_a_farm
  puts "\n\n\nFARM BUILDER"
  print "How many acres is your farm? "
  acres = gets.chomp.to_i

  print "What type of crop? "
  crop = gets.chomp

  print "What is the harvest method? "
  harvest_method = gets.chomp

  print "Is it planted (Y/N)? "
  planted = gets.chomp.downcase

  while planted != "y" && planted != "n"
    print "Sorry! Not a valid input. Is it planted (Y/N)? "
    planted = gets.chomp.downcase
  end

  if planted == "y"
    planted = true
  elsif planted == "n"
    planted = false
  else
    puts "SOMETHING WEIRD HAS HAPPEND"
    planted = false
  end

  Farm.new(acres: acres, crop: crop, harvest_method: harvest_method,
           planted: planted)
end

def build_a_bear
  puts "\n\n\nBEAR BUILDER\n"
  print "What would you like your bear to be called? "
  name = gets.chomp

  print "How old is #{name}? "
  age = gets.chomp.to_i

  print "How tall is #{name}? "
  height = gets.chomp

  print "How many humans has #{name} eaten? "
  humans_eaten = gets.chomp.to_i

  Bear.new(name: name, age: age, height: height, humans_eaten: humans_eaten)
end

def bear_report(bear)
  puts "\n\n\nBEAR REPORT\n"
  puts "Your bear is named #{bear.name}."
  puts "Your bear is #{bear.height} feet tall."
  puts "Your bear is #{bear.age} year(s) old."
  puts "Your bear has eaten #{bear.humans_eaten} human(s)."
end

def farm_report(farm)
  puts "\n\n\nFARM REPORT\n"
  puts "Your farm has #{farm.acres} acre(s)."
  puts "Your farm is of #{farm.crop}"
  puts "Your farm will be harvested by #{farm.harvest_method}"
  puts "Is your farm planted? #{farm.planted}"
end

def report_all_bears(arr)
  arr.each do |bear|
    bear_report(bear)
  end
end

def select_a_bear(bears)
  bear = nil
  
  if !bears.empty?
    # Display the bears
    bears.each_with_index do |bear, index|
      puts "#{index}: #{bear.name}"
    end

    # Prompt for choice
    print "Which bear would you like? "
    choice = gets.chomp.to_i

    if choice < 0 || choice >= bears.length
      puts "Not a valid choice"
      print "Which bear would you like? "
      choice = gets.chomp.to_i
    end

    bear = bears[choice]
  end

  bear
end

def select_a_farm(farms)
  farm = nil
  
  if !farms.empty?
    farms.each_with_index do |farm, index|
      puts "#{index}: #{farm.acres} of #{farm.crop}"
    end
    
    # Prompt for choice
    print "Which farm would you like? "
    choice = gets.chomp.to_i

    if choice < 0 || choice >= farms.length
      puts "Not a valid choice"
      print "Which farm would you like? "
      choice = gets.chomp.to_i
    end

    farm = farms[choice]
  end
  farm
end


# Declaration of Variables
bears = []
farms = []

choice = 3

puts "WELCOME TO THE BEAR FARM FOR BEARS"

while choice != 0
  puts "\n\nYou have #{bears.length} bear(s)."
  puts "\nHere are your options:\n1. New Bear\n2. Bears Report\n3. New Farm\n4. Give a bear a farm\n0. Exit"
  print "What is your choice? "
  choice = gets.chomp.to_i

  # MAIN MENU
  if choice == 1
    bears << build_a_bear
    bear_report(bears.last)
  elsif choice == 2
    report_all_bears(bears)
  elsif choice == 3
    farms << build_a_farm
    farm_report(farms.last)
  elsif choice == 4
    puts "Let's give a bear a farm"
    # Pick a bear
    bear = select_a_bear(bears)
    bear_report(bear)
    # Pick a farm
    farm = select_a_farm(farms)
    farm_report(farm)
    # Join them
    bear.acquires_farm(farm)
  elsif choice == 0
    puts "\n\nGoodbye!"
  else
    puts "\n\nSorry! Not a valid input"
  end
end
