require 'array'
require 'rspec'

describe Array do

  describe "#my_uniq" do
    let(:array) {[1,2,3]}

    it "does not modify original" do
      duped_array = array.dup
      duped_array.my_uniq
      expect(duped_array).to eq(array)
    end

    it "returns uniq values" do
      expect([3, 2, 2, 1].my_uniq).to eq([3, 2, 1])
    end

    it "doesn't use #uniq method" do
      original_array = ["original array"]
      expect(original_array).not_to receive(:uniq)
      original_array.my_uniq{}
    end
  end

  describe "#two_sum" do
    context "when handling zeroes" do
      it "handles a single zero" do
        expect([4, 0, -4, 2, 3].two_sum).to eq ([[0,2]])
      end

      it "handles multiple zeroes" do
        expect([4, 0, 0, -4, 2, 3].two_sum).to eq ([[0,3],[1,2]])
      end
    end

    it "return array of indices whose numbers sum to zero" do
      expect([3, 2, -2, 1].two_sum).to eq([[1,2]])
    end

    it "adds pairs in order" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#my_transpose" do
    let(:matrix) {
      [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ]
      }
   it "does not modify original" do
     duped_array = matrix.dup
     duped_array.my_tranpose
     expect(duped_array).to eq(matrix)
   end

    it "tranposes the rows and columns of an array of arrays" do
        expect(matrix.my_tranpose).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end

  end

end
