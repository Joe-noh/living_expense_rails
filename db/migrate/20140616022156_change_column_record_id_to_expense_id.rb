class ChangeColumnRecordIdToExpenseId < ActiveRecord::Migration
  def change
    rename_column :items, :record_id, :expense_id
  end
end
