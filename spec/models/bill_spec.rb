require 'spec_helper'

describe Bill do
  before(:each) do
    User.create!(:name => "Test User A", :residence_id => 1)
    User.create!(:name => "Another Test User", :residence_id => 1)
    @valid_attributes = {
      :title => "value for title",
      :amount => 9.99,
      :is_evenly_split => false,
      :user_ids => [1, 2],
      :deadline => Time.now,
      :is_recurring => false,
      :residence_id => 1
    }
    @attributes_with_no_users = {
      :title => "value for title",
      :amount => 9.99,
      :is_evenly_split => false,
      :deadline => Time.now,
      :is_recurring => false,
      :residence_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Bill.create!(@valid_attributes)
  end
  
  it "should not create a new instance given no assigned users" do
    Bill.create(@attributes_with_no_users) == false
  end
  
  it "should produce a sorted user string" do
    @bill = Bill.create!(@valid_attributes)
    @bill.sorted_users_string.should == "Another Test User, Test User A"
  end
end
