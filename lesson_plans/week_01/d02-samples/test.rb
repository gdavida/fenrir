require "pry"

# letter_count is an integer
# phrase is string
#
# letter_count is a guess for how many characters are in phrase
def guess_length(letter_count, phrase)
  if letter_count == phrase.length
    "Yep!"
  else
    "Nope!"
  end
end

puts guess_length(12, "hello") # line 14 interrupt
puts guess_length(5, "hello") # line 11 interrupt

binding.pry
