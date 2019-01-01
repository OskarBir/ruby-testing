require_relative '../lib/sudoku'

RSpec.describe Sudoku do

  let(:sudoku) { Sudoku.new("530070000600195000098000060800060003400803001700020006060000280000419005000080079") }
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
      expect(sudoku.get_row(0)).to match_array([5,3,0,0,7,0,0,0,0])
    end
  end

  context "#get column" do
    it "checks if column is an array" do
      expect(sudoku.get_column(0)).to be_a_kind_of(Array)
    end

    it "checks if column is a valid column" do
      expect(sudoku.get_column(0)).to match_array([5,6,0,8,4,7,0,0,0])
    end
  end

  context "#board" do

    it "checks if there is any output" do
      expect { sudoku.board }.to output.to_stdout
    end

    it "checks if the output matches the expected output" do
      expect { sudoku.board }.to output("\n- - - - - - - - - - - - \n| 5 3 0 | 0 7 0 | 0 0 0 \n| 6 0 0 | 1 9 5 | 0 0 0 \n| 0 9 8 | 0 0 0 | 0 6 0 \n- - - - - - - - - - - - \n| 8 0 0 | 0 6 0 | 0 0 3 \n| 4 0 0 | 8 0 3 | 0 0 1 \n| 7 0 0 | 0 2 0 | 0 0 6 \n- - - - - - - - - - - - \n| 0 6 0 | 0 0 0 | 2 8 0 \n| 0 0 0 | 4 1 9 | 0 0 5 \n| 0 0 0 | 0 8 0 | 0 7 9 ").to_stdout
    end
  end


  context "#nine_box_grid" do

    it "checks if array is returned" do
      expect(sudoku.nine_box_grid(0,0)).to be_a_kind_of(Array)
    end

  end





end