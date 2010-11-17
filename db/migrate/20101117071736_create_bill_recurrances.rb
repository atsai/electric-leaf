class CreateBillRecurrances < ActiveRecord::Migration
  def self.up
    create_table :bill_recurrances do |t|
      t.datetime :end_date
      t.boolean :is_monthly
      t.boolean :is_bimonthly

      t.timestamps
    end
  end

  def self.down
    drop_table :bill_recurrances
  end
end
