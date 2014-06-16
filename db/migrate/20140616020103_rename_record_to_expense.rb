class RenameRecordToExpense < ActiveRecord::Migration
  def change
    rename_table :records, :expenses
  end
end
