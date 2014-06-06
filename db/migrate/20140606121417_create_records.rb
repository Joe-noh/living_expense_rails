class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :purpose
      t.string :responsible
      t.date :payday
      t.integer :in_out

      t.timestamps
    end
  end
end
