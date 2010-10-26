class CreateChores < ActiveRecord::Migration
  def self.up
    create_table :chores do |t|
      t.string :title
      t.string :description
      t.datetime :deadline
      t.boolean :is_recurring
      t.boolean :is_rotating

      t.timestamps
    end
  end

  def self.down
    drop_table :chores
  end
end
