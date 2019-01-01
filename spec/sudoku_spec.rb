require_relative '../lib/sudoku'

RSpec.describe Sudoku do

  let(:sudoku) {Sudoku.new("530070000600195000098000060800060003400803001700020006060000280000419005000080079")}
  let(:too_hard_sudoku) {Sudoku.new("000600070000043090600000003850000000720050069364900081000830004000090035037000600")}
  let(:too_short_sudoku) {Sudoku.new("123456")}
  let(:too_long_sudoku) {Sudoku.new("0006000700000430906000000038500000007200500693649000810008300040000900350370006003245")}

  context "#create rows" do
    it "checks if array is created" do
      expect(sudoku.create_rows).to be_a_kind_of(Array)
    end

    it "checks if 2 dimensional array is created" do
      expect(sudoku.create_rows[0]).to be_a_kind_of(Array)
    end

    it "checks if array elements contains numbers from 0 to 9" do
      expect(sudoku.create_rows).to all(all(be_kind_of(Integer).and(be >= 0).and(be <= 9)))
    end
  end

  context "#get row" do
    it "checks if row is an array" do
      expect(sudoku.get_row(0)).to be_a_kind_of(Array)
    end

    it "checks if row is a valid column" do
      expect(sudoku.get_row(0)).to match_array([5, 3, 0, 0, 7, 0, 0, 0, 0])
    end
  end

  context "#get column" do
    it "checks if column is an array" do
      expect(sudoku.get_column(0)).to be_a_kind_of(Array)
    end

    it "checks if column is a valid column" do
      expect(sudoku.get_column(0)).to match_array([5, 6, 0, 8, 4, 7, 0, 0, 0])
    end
  end

  context "#board" do

    it "checks if there is any output" do
      expect {sudoku.board}.to output.to_stdout
    end

    it "checks if the output matches the expected output" do
      expect {sudoku.board}.to output("\n- - - - - - - - - - - - \n| 5 3 0 | 0 7 0 | 0 0 0 \n| 6 0 0 | 1 9 5 | 0 0 0 \n| 0 9 8 | 0 0 0 | 0 6 0 \n- - - - - - - - - - - - \n| 8 0 0 | 0 6 0 | 0 0 3 \n| 4 0 0 | 8 0 3 | 0 0 1 \n| 7 0 0 | 0 2 0 | 0 0 6 \n- - - - - - - - - - - - \n| 0 6 0 | 0 0 0 | 2 8 0 \n| 0 0 0 | 4 1 9 | 0 0 5 \n| 0 0 0 | 0 8 0 | 0 7 9 ").to_stdout
    end
  end


  context "#nine_box_grid" do

    it "checks if array is returned" do
      expect(sudoku.nine_box_grid(0, 0)).to be_a_kind_of(Array)
    end

    it "checks if the correct array is returned" do
      expect(sudoku.nine_box_grid(4, 4)).to match_array([0, 6, 0, 8, 0, 3, 0, 2, 0])
    end

    it "checks if the size of array is valid" do
      expect(sudoku.nine_box_grid(8, 8).size).to eq(9)
    end

  end

  context "#sudoku_solve!" do

    it "checks if there is any output" do
      expect {sudoku.sudoku_solve!}.to output.to_stdout
    end

    it "checks if function returns nil" do
      expect(sudoku.sudoku_solve!).to be_nil
    end

    it "checks if error is raised when there is no solution" do
      expect {too_hard_sudoku.sudoku_solve!}.to raise_error(ArgumentError, "no solution")
    end

  end

  context "#validate" do

    it "checks if error is raise when sudoku is too short" do
      expect {too_short_sudoku}.to raise_error(ArgumentError, " Your input must be 81 character long and currently it is less than 81")
    end

    it "checks if error is raise when sudoku is too long" do
      expect {too_long_sudoku}.to raise_error(ArgumentError, "Your input must be 81 character long and currently it is greater than 81")
    end

  end
end