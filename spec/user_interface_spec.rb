require_relative '../lib/sudoku'
require_relative '../lib/user_interface'

RSpec.describe User_interface do

  let(:user_interface) {User_interface.new}

  describe "#start_game" do

    before do
      allow(user_interface).to receive(:enter_or_read).and_return(true)
      allow(user_interface).to receive(:gets).and_return("530070000600195000098000060800060003400803001700020006060000280000419005000080079")
    end

    it "checks if lines are displayed" do
      expect {user_interface.start_game}.to output(/Let's start the game!/).to_stdout
    end

    it "checks if lines are displayed" do
      expect {user_interface.start_game}.to output(/Would you like to enter the numbers or read them from file?/).to_stdout
    end

    it "checks if lines are displayed" do
      expect {user_interface.start_game}.to output(/Let's fill out a sudoku table with your original inputs:/).to_stdout
    end

    it "checks if entering 81 character path works" do
      expect {user_interface.start_game}.to output(/Please enter the 81 numbers characters found in the original Sudoku table/).to_stdout
    end

    it "checks if reading form file path works" do
      allow(user_interface).to receive(:enter_or_read).and_return(false)
      allow(user_interface).to receive(:read_from_file).and_return("530070000600195000098000060800060003400803001700020006060000280000419005000080079")
      expect {user_interface.start_game}.to output(/Please enter full file path/).to_stdout
    end
  end

  describe "#solve" do

    before do
      allow(user_interface).to receive(:enter_or_read).and_return(true)
      allow(user_interface).to receive(:gets).and_return("530070000600195000098000060800060003400803001700020006060000280000419005000080079")
    end

    it "checks if lines are displayed" do
      expect {user_interface.solve}.to output(/Are you ready to see how I help you to solve your Sudoku game?/).to_stdout
    end

    it "checks if Y path works" do
      allow(user_interface).to receive(:gets).and_return("Y")
      allow(@game).to receive(:sudoku_solve!).and_return(nil)
      expect {user_interface.solve}.to output(/I did it!/).to_stdout
    end

    it "checks if N path works" do
      allow(user_interface).to receive(:gets).and_return("N")
      expect {user_interface.solve}.to output(/Goodbye!/).to_stdout
    end

    it "checks if else path works" do
      allow(user_interface).to receive(:gets).and_return("xd")
      expect {user_interface.solve}.to output(/I dont understand what you are saying/).to_stdout
    end

    it "checks if lines are displayed" do
      expect {user_interface.solve}.to output(/I hope I was helpful =\)/).to_stdout
    end
  end

  describe "#enter_or_read" do
    it "checks if enter return true" do
      allow(user_interface).to receive(:gets).and_return("enter")
      expect(user_interface.enter_or_read).to eq(true)
    end

    it "checks if enter return false" do
      allow(user_interface).to receive(:gets).and_return("read")
      expect(user_interface.enter_or_read).to eq(false)
    end

    it "checks if it raises error" do
      allow(user_interface).to receive(:gets).and_return("xd")
      expect {user_interface.enter_or_read}.to raise_error(ArgumentError, "Something went wrong, please try again.")
    end
  end

  describe "#read_from_file" do

    it "checks if method raises error if no such file" do
      expect {user_interface.read_from_file("XD")}.to raise_error(ArgumentError, "No such file. Please try again")
    end

    it "checks if nil raises error" do
      expect {user_interface.read_from_file(nil)}.to raise_error(ArgumentError, "No such file. Please try again")
    end
  end

end

