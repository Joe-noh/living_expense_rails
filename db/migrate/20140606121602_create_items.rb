class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :record_id
      t.string :name
      t.integer :count
      t.integer :unit_price

      t.timestamps
    end
  end
end
