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

    describe "#solve" do

      it "checks if lines are displayed" do
        user_interface.stub :gets, "n" do
          assert_output(/Are you ready to see how I help you to solve your Sudoku game?/) {user_interface.solve}
        end
      end

      it "checks if Y path works" do
        user_interface.stub :gets, "n" do
            assert_output(/Goodbye!/) {user_interface.solve}
        end
      end

      it "checks if N path works" do
        user_interface.stub :gets, "n" do
          assert_output(/Goodbye!/) {user_interface.solve}
        end
      end

      it "checks if else path works" do
        user_interface.stub :gets, "xd" do
          assert_output(/I dont understand what you are saying/) {user_interface.solve}
        end
      end

      it "checks if lines are displayed" do
        user_interface.stub :gets, "xd" do
          assert_output(/I hope I was helpful =\)/) {user_interface.solve}
        end
      end
    end


    describe "#enter_or_read" do
      it "checks if enter return true" do
        user_interface.stub :gets, "enter" do
          user_interface.enter_or_read.must_equal(true)
        end
      end

      it "checks if enter return false" do
        user_interface.stub :gets, "read" do
          user_interface.enter_or_read.must_equal(false)
        end
      end

      it "checks if it raises error" do
        user_interface.stub :gets, "xd" do
          proc {user_interface.enter_or_read}.must_raise ArgumentError
        end
      end
    end

    describe "#read_from_file" do

      it "checks if method raises error if no such file" do
        proc {user_interface.read_from_file("XD")}.must_raise ArgumentError
      end

      it "checks if nil raises error" do
        proc {user_interface.read_from_file(nil)}.must_raise ArgumentError
      end
    end

  end
end
