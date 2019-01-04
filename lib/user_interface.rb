require_relative 'sudoku'

class User_interface

  def read_from_file(filepath)
    begin
      File.read(filepath)
    rescue
      raise ArgumentError, 'No such file. Try again'
    end
  end

  def start_game
    puts "Let's start the game!"
    correct = false
    until correct
      puts "Would you like to enter the numbers or read them from file? (enter/read)"
      input = gets.chomp
      if input == "enter"
        puts " Please enter the 81 numbers characters found in the original Sudoku table, including zeros ('0') for any blank space(ex: 50030050060110440555...)"
        user_input = gets.chomp
        string_input = user_input.to_s
        @game = Sudoku.new(string_input)
        correct = true
      elsif input == "read"
        puts "Please enter full file path (ex:/home/oskar/ruby_sudoku/projektsemestralny-xddd/lib/plansza.txt)"
        @game = Sudoku.new(read_from_file(gets.chomp))
        correct = true
      else
        puts "Something went wrong, please try again."
      end
    end
    puts "Let's fill out a sudoku table with your original inputs: "
    # Here goes the code for printing the board without solving it
    @game.board
    puts
  end

  def solve
    puts "Are you ready to see how I help you to solve your Sudoku game?, enter 'Y' for yes and 'N'for no "
    user_decision = gets.chomp
    if user_decision.upcase == "Y"
      @game.sudoku_solve!
    elsif user_decision.upcase == "N"
      puts "Goodbye!"
    else
      puts "I dont understand what you are saying"
    end
    puts "I hope I was helpful =)"
  end
end

user_interface = User_interface.new
user_interface.start_game
user_interface.solve


