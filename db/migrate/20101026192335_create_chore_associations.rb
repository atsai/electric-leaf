class CreateChoreAssociations < ActiveRecord::Migration
  def self.up
    create_table :chore_associations do |t|
      t.integer :user_id
      t.integer :chore_id

      t.timestamps
    end
  end

  def self.down
    drop_table :chore_associations
  end
end
