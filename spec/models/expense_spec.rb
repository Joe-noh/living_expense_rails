require 'rails_helper'

describe Expense do
  let(:expense) { FactoryGirl.create(:expense) }

  subject { expense }

  %i(id purpose responsible payday in_out items).each do |method|
    it { should respond_to method }
  end

  describe "purpose" do
    it "should not be blank" do
      expense.purpose = " "
      expect(expense).not_to be_valid
    end
  end

  describe "responsible" do
    it "should be an UNIX user name" do
      normals   = ["john", "john123", "j"]
      abnormals = ["john doe", "John", "123john", "  "]

      normals.each do |name|
        expense.responsible = name
        expect(expense).to be_valid
      end

      abnormals.each do |name|
        expense.responsible = name
        expect(expense).not_to be_valid
      end
    end
  end

  describe "in_out" do
    it "should be :outgoing or :incoming" do
      normals   = ["outgoing", "incoming"]
      abnormals = ["outgo", :incoming]

      normals.each do |in_out|
        expense.in_out = in_out
        expect(expense).to be_valid
      end

      abnormals.each do |in_out|
        expense.in_out = in_out
        expect(expense).not_to be_valid
      end
    end
  end
end
