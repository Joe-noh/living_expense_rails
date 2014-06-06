require 'rails_helper'

describe Record do
  let(:record) do
    Record.new(purpose:     "BBQ Party",
               responsible: "jhonzawa",
               payday:      Date.today,
               in_out:      :outgoing)
  end

  subject { record }

  %i(id purpose responsible payday in_out items).each do |method|
    it { should respond_to method }
  end

  describe "purpose" do
    it "should not be blank" do
      record.purpose = " "
      expect(record).not_to be_valid
    end
  end

  describe "responsible" do
    it "should be an UNIX user name" do
      normals   = ["john", "john123", "j"]
      abnormals = ["john doe", "John", "123john", "  "]

      normals.each do |name|
        record.responsible = name
        expect(record).to be_valid
      end

      abnormals.each do |name|
        record.responsible = name
        expect(record).not_to be_valid
      end
    end
  end

  describe "in_out" do
    it "should be :outgoing or :incoming" do
      normals   = [:outgoing, "incoming"]
      abnormals = [:outgo, "income"]

      normals.each do |in_out|
        record.in_out = in_out
        expect(record).to be_valid
      end

      abnormals.each do |in_out|
        expect { record.in_out = in_out }.to raise_error
      end
    end
  end
end
