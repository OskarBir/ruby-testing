require_relative '../lib/sudoku'
require_relative '../lib/user_interface'

RSpec.describe User_interface do

  let(:user_interface) { User_interface.new }

  context "#enter_or_read" do
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

  context "#read_from_file" do
    it "checks if method read from file correctly" do
      expect(user_interface.read_from_file("/home/oskar/ruby_sudoku/projektsemestralny-xddd/lib/plansza.txt")).to eq("530070000600195000098000060800060003400803001700020006060000280000419005000080079")
    end

    it "checks if method raises error if no such file" do
      expect {user_interface.read_from_file("XD")}.to raise_error(ArgumentError, "No such file. Please try again")
    end


  end

end




# before do
#   allow($stdout).to receive(:write)
# end