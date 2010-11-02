class CreateBillAssociations < ActiveRecord::Migration
  def self.up
    create_table :bill_associations do |t|
      t.integer :user_id
      t.integer :bill_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bill_associations
  end
end
