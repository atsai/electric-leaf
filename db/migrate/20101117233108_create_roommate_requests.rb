class CreateRoommateRequests < ActiveRecord::Migration
  def self.up
    create_table :roommate_requests do |t|
      t.integer :user_id
      t.integer :requester_id
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :roommate_requests
  end
end
