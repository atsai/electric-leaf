class CreateBills < ActiveRecord::Migration
  def self.up
    create_table :bills do |t|
      t.string :title
      t.decimal :amount
      t.boolean :is_evenly_split
      t.datetime :deadline
      t.boolean :is_recurring
      t.integer :residence_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bills
  end
end
