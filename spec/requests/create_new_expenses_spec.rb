require 'rails_helper'

RSpec.describe "CreateNewExpenses", :type => :request do

  let(:expense) { FactoryGirl.build :expense }

  describe 'create an expense' do
    before do
      visit new_expense_path

      fill_in 'Purpose',     with: expense.purpose
      fill_in 'Responsible', with: expense.responsible
      fill_in 'Payday',      with: expense.payday
    end

    it 'save new expense to database' do
      expect { click_button 'Save' }.to change(Expense, :count).by 1
    end

    context 'with an item' do
      let(:item) { FactoryGirl.build :item }

      before do
        fill_in 'Name',       with: item.name
        fill_in 'Unit price', with: item.unit_price
        fill_in 'Count',      with: item.count
      end

      it 'save an expense' do
        expect { click_button 'Save' }.to change(Item, :count).by 1
      end

      it 'save an item' do
        expect { click_button 'Save' }.to change(Expense, :count).by 1
      end
    end
  end
end
