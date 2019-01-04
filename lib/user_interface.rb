require_relative 'sudoku'

class User_interface

  def start_game
    puts "Let's start the game!"
    puts "Would you like to enter the numbers or read them from file? (enter/read)"
    if enter_or_read
      puts "Please enter the 81 numbers characters found in the original Sudoku table, including zeros ('0') for any blank space(ex: 50030050060110440555...)"
      @game = Sudoku.new(gets.chomp.to_s)
    else
      puts "Please enter full file path (ex:/home/oskar/ruby_sudoku/projektsemestralny-xddd/lib/plansza.txt)"
      @game = Sudoku.new(read_from_file(gets.chomp))
    end
    puts "Let's fill out a sudoku table with your original inputs: "
    # Here goes the code for printing the board without solving it
    @game.board
    puts
    solve
  end

  def solve
    puts "Are you ready to see how I help you to solve your Sudoku game?, enter 'Y' for yes and 'N'for no "
    user_decision = gets.chomp
    if user_decision.upcase == "Y"
      @game.sudoku_solve!
      puts "I did it!"
    elsif user_decision.upcase == "N"
      puts "Goodbye!"
    else
      puts "I dont understand what you are saying"
    end
    puts "I hope I was helpful =)"
  end

  def enter_or_read
    input = gets.chomp
    if input == "enter"
      true
    elsif input == "read"
      false
    else
      raise ArgumentError, "Something went wrong, please try again."
    end
  end

  def read_from_file(filepath)
    begin
      File.read(filepath)
    rescue
      raise ArgumentError, "No such file. Please try again"
    end
  end
end

