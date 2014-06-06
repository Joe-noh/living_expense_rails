require 'rails_helper'

describe Item do
  let(:item) do
    Item.new(name:       "Beef",
             count:      3,
             unit_price: 50)
  end

  subject { item }

  shared_examples_for "natural number" do
  end

  %i(id record_id name count unit_price).each do |method|
    it { should respond_to method }
  end

  describe "name" do
    it "should not be empty" do
      item.name = " "
      expect(item).not_to be_valid
    end
  end

  describe "count" do
    it "should be a natural number" do
      normals   = [1, 100, 10000]
      abnormals = [0, -10, " "]

      normals.each do |n|
        item.count = n
        expect(item).to be_valid
      end

      abnormals.each do |n|
        item.count = n
        expect(item).not_to be_valid
      end
    end
  end

  describe "unit_price" do
    it "should be a natural number" do
      normals   = [1, 100, 10000]
      abnormals = [0, -10, " "]

      normals.each do |n|
        item.unit_price = n
        expect(item).to be_valid
      end

      abnormals.each do |n|
        item.unit_price = n
        expect(item).not_to be_valid
      end
    end
  end
end
