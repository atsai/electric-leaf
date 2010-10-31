require 'spec_helper'

describe Chore do
  before(:each) do
    User.create!(:name => "Test User A", :residence_id => 1)
    User.create!(:name => "Another Test User", :residence_id => 1)
    @valid_attributes = {
      :title => "value for title",
      :description => "value for description",
      :deadline => Time.now,
      :user_ids => [1, 2],
      :is_recurring => false,
      :is_rotating => false,
      :is_done => false,
      :residence_id => 1
    }
    @attributes_with_no_users = {
      :title => "value for title",
      :description => "value for description",
      :deadline => Time.now,
      :is_recurring => false,
      :is_rotating => false,
      :is_done => false,
      :residence_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Chore.create!(@valid_attributes)
  end
  
  it "should not create a new instance given no assigned users" do
    Chore.create(@attributes_with_no_users) == false
  end
  
  it "should produce a sorted user string" do
    @chore = Chore.create!(@valid_attributes)
    @chore.sorted_users_string.should == "Another Test User, Test User A"
  end
end
