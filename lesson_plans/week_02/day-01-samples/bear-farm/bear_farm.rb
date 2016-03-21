require "pry"
require_relative "bear.rb"

options = {}

print "What is your bear's name? "
options[:name] = gets.chomp

print "What is your bear's age? "
options[:age] = gets.chomp.to_i

print "What is your bear's height? "
options[:height] = gets.chomp

b = Bear.new(options)

binding.pry
