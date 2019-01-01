require_relative 'sudoku'

puts "Let's start the game!"
correct = false
while correct == false
  puts "Would you like to enter the numbers or read them from file? (enter/read)"
  input = gets.chomp
  if input == "enter"
    puts " Please enter the 81 numbers characters found in the original Sudoku table, including zeros ('0') for any blank space(ex: 50030050060110440555...)"
    user_input = gets.chomp
    string_input = user_input.to_s
    game = Sudoku.new(string_input)
    correct = true
  elsif input == "read"
    puts "Please enter file name: (file name must be in lib folder)"
    game = Sudoku.new(File.read("/home/oskar/ruby_sudoku/projektsemestralny-xddd/lib/#{gets.chomp}"))
    correct = true
  else
    puts "Something went wrong, try again"
  end
end


puts "Let's fill out a sudoku table with your original inputs: "
# Here goes the code for printing the board without solving it
game.board
puts

puts "Are you ready to see how I help you to solve your Sudoku game?, enter 'Y' for yes and 'N'for no "
user_decision = gets.chomp
if user_decision.upcase == "Y"
  @game.sudoku_solve!
elsif user_decision.upcase == "N"
  puts "Goodbye!"
else
  "I dont understand what you are saying"
end

puts "I hope I was helpful =)"
