require_relative '../lib/user_interface'
require 'minitest/autorun'


class TestInterface < Minitest::Test


  describe User_interface do

    let(:user_interface) {User_interface.new}

    # before do
    #   @original_stdout = $stdout
    #   $stdout = File.new("out.txt", 'w')
    # end

    describe "#start_game" do

      it "checks if lines are displayed" do
        user_interface.stub :enter_or_read, true do
          user_interface.stub :gets, "530070000600195000098000060800060003400803001700020006060000280000419005000080079" do
        assert_output(/Let's start the game!/) {user_interface.start_game}
          end
        end
      end

      it "checks if lines are displayed" do
        user_interface.stub :enter_or_read, true do
          user_interface.stub :gets, "530070000600195000098000060800060003400803001700020006060000280000419005000080079" do
            assert_output(/Would you like to enter the numbers or read them from file?/) {user_interface.start_game}
          end
        end
      end

      it "checks if lines are displayed" do
        user_interface.stub :enter_or_read, true do
          user_interface.stub :gets, "530070000600195000098000060800060003400803001700020006060000280000419005000080079" do
            assert_output(/Let's fill out a sudoku table with your original inputs:/) {user_interface.start_game}
          end
        end
      end

      it "checks if entering 81 character path works" do
        user_interface.stub :enter_or_read, true do
          user_interface.stub :gets, "530070000600195000098000060800060003400803001700020006060000280000419005000080079" do
            assert_output(/Please enter the 81 numbers characters found in the original Sudoku table/) {user_interface.start_game}
          end
        end
      end


      it "checks if reading form file path works" do
        user_interface.stub :enter_or_read, false do
          user_interface.stub :read_from_file, "530070000600195000098000060800060003400803001700020006060000280000419005000080079" do
            user_interface.stub :gets, "n" do
            assert_output(/Please enter full file path/) {user_interface.start_game}
            end
          end
        end
      end

    end
  end
end
