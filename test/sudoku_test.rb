require_relative '../lib/sudoku'
require 'minitest/autorun'

class TestSudoku < Minitest::Test


  describe Sudoku do

    before do
      @original_stdout = $stdout
      $stdout = File.new("out.txt", 'w')
    end

    let(:sudoku) {Sudoku.new("530070000600195000098000060800060003400803001700020006060000280000419005000080079")}
    let(:too_hard_sudoku) {Sudoku.new("000600070000043090600000003850000000720050069364900081000830004000090035037000600")}
    let(:too_short_sudoku) {Sudoku.new("123456")}
    let(:too_long_sudoku) {Sudoku.new("0006000700000430906000000038500000007200500693649000810008300040000900350370006003245")}

    describe "#create rows" do
      it "checks if array is created" do
        sudoku.create_rows.must_be_kind_of(Array)
      end

      it "checks if 2 dimensional array is created" do
        sudoku.create_rows[0].must_be_kind_of(Array)
      end

      it "checks if array elements contains numbers from 0 to 9" do
        sudoku.create_rows.flatten.each do |value|
           [1,2,3,4,5,6,7,8,9,0].must_include value
        end
      end
    end

    describe "#get row" do
      it "checks if row is an array" do
       sudoku.get_row(0).must_be_kind_of(Array)
      end

      it "checks if row is a valid row" do
        assert_empty(sudoku.get_row(0)-[5, 3, 0, 0, 7, 0, 0, 0, 0])
      end
    end

    describe "#get column" do
      it "checks if column is an array" do
        sudoku.get_column(0).must_be_kind_of(Array)
      end

      it "checks if column is a valid column" do
        assert_empty(sudoku.get_column(0)-[5, 6, 0, 8, 4, 7, 0, 0, 0])
      end
    end

    describe "#board" do

      it "checks if there is any output" do
        assert_output(/-/) {sudoku.board}
      end

      it "checks if the output matches the expected output" do
        assert_output(stdout = "\n- - - - - - - - - - - - \n| 5 3 0 | 0 7 0 | 0 0 0 \n| 6 0 0 | 1 9 5 | 0 0 0 \n| 0 9 8 | 0 0 0 | 0 6 0 \n- - - - - - - - - - - - \n| 8 0 0 | 0 6 0 | 0 0 3 \n| 4 0 0 | 8 0 3 | 0 0 1 \n| 7 0 0 | 0 2 0 | 0 0 6 \n- - - - - - - - - - - - \n| 0 6 0 | 0 0 0 | 2 8 0 \n| 0 0 0 | 4 1 9 | 0 0 5 \n| 0 0 0 | 0 8 0 | 0 7 9 ")  {sudoku.board}
      end
    end


    describe "#nine_box_grid" do

      it "checks if array is returned" do
        sudoku.nine_box_grid(0, 0).must_be_kind_of(Array)
      end

      it "checks if the correct array is returned" do
        assert_empty(sudoku.nine_box_grid(4, 4)-[0, 6, 0, 8, 0, 3, 0, 2, 0])
      end

      it "checks if the size of array is valid" do
        sudoku.nine_box_grid(8, 8).size.must_equal(9)
      end

    end

    describe "#sudoku_solve!" do

      it "checks if there is any output" do
        assert_output(/-/) {sudoku.sudoku_solve!}
      end

      it "checks if function returns nil" do
        assert_nil(sudoku.sudoku_solve!)
      end

      it "checks if error is raised when there is no solution" do
        proc { too_hard_sudoku.sudoku_solve! }.must_raise ArgumentError
      end

    end

    describe "#validate" do

      it "checks if error is raise when sudoku is too short" do
        proc {too_short_sudoku}.must_raise ArgumentError
      end

      it "checks if error is raise when sudoku is too long" do
        proc {too_long_sudoku}.must_raise ArgumentError
      end

    end

  end
end
