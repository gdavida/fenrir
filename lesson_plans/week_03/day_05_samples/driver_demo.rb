# require statements

# Index
# Show
# New / Create
# Edit / Update
# Destroy

# main menu
# - sub-menus

def insects_menu
  choice = ""

  while choice != "back"
    puts "\n\n\nInsects Main Menu"
    puts "1. See all insects"
    puts "2. New insect"
    puts "Back: head back to the main menu"
    print "What is your choice? "
    choice = gets.chomp.downcase

    while choice != "1" && choice != "2" && choice != "back"
      print "Sorry, that's invalid. Try again: "
      choice = gets.chomp.downcase
    end

    if choice == "1"
      puts "See all insects!"
    elsif choice == "2"
      puts "New insect!"
    elsif choice == "back"
      puts "See ya!"
    end
  end
  
  puts "back to the main menu"
end

def main_menu
  choice = ""

  while choice != "exit"
  
    puts "\n\n\nMain Menu Options:"
    puts "1. Insects"
    puts "2. Researchers"
    puts "Exit: Exit"
    print "What is your choice? "
    choice = gets.chomp.downcase

    while choice != "1" && choice != "2" && choice != "exit"
      print "Sorry, that's not a valid option. Try again: "
      choice = gets.chomp.downcase
    end

    if choice == "1"
      puts "==============leaving the main menu"
      insects_menu # method call
      puts "==============back in the main menu"
    elsif choice == "2"
      puts "Heading to the researchers menu"
    elsif choice == "exit"
      puts "You chose to leave"
    end
  end
end

# this is where our driver actually starts

puts "Welcome to Our Driver Demo!"
main_menu
puts "Goodbye"

