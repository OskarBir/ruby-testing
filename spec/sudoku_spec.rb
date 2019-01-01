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

end