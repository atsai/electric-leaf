class AddUserColumns < ActiveRecord::Migration

  def self.up
    add_column :users, :email, :string
    add_column :users, :fb_id, :integer
    add_column :users, :access_token, :string
  end

  def self.down
    remove_column :users, :email
    remove_column :users, :fb_id
    remove_column :users, :access_token
  end

end
