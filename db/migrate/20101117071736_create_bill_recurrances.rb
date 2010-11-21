class CreateBillRecurrances < ActiveRecord::Migration
  def self.up
    create_table :bill_recurrances do |t|
      t.datetime :end_date
      t.string :recurrance
      t.integer :bill_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bill_recurrances
  end
end
