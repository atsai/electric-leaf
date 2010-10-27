class CreateResidences < ActiveRecord::Migration
  def self.up
    create_table :residences do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :residences
  end
end
