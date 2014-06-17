require 'rails_helper'

describe Expense do
  let(:expense) { FactoryGirl.create(:expense) }

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

  describe "instance methods" do

    before :all do
      @exp = Expense.new
      @exp.items.build(name: "Potato", unit_price: 100, count: 2)
      @exp.items.build(name: "Tomato", unit_price: 120, count: 1)
    end

    describe "amount_total" do
      it "should return sum of all amount of money of the expense" do
        expect(@exp.amount_total).to eql 320
      end
    end

    describe "amount_total_to_s" do
      it "should return human readable notation" do
        expect(@exp.amount_total_to_s).to eql '- 320 Yen'
      end
    end
  end

  describe "class methods" do

    before do
      Expense.delete_all
    end

    describe "amount_total" do
      it "should return sum of money" do
        FactoryGirl.create(:expense_800)
        FactoryGirl.create(:expense_800)
        FactoryGirl.create(:expense_800)
        FactoryGirl.create(:expense_800, in_out: 'incoming')
        expect(Expense.balance).to eql -1600

        FactoryGirl.create(:expense_800, in_out: 'incoming')
        expect(Expense.balance).to eql -800
      end
    end

    describe "red?" do
      it "should detect a deficit" do
        FactoryGirl.create(:expense_800)
        expect(Expense.red?).to be_truthy

        FactoryGirl.create(:expense_800, in_out: 'incoming')
        expect(Expense.red?).to be_falsey

        FactoryGirl.create(:expense_800, in_out: 'incoming')
        expect(Expense.red?).to be_falsey
      end
    end
  end
end
