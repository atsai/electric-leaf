require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :residence_id => 1
    }
    Residence.create!
    User.create!(:name => "Test User A", :residence_id => 1)
    User.create!(:name => "Test User B", :residence_id => 1)
    User.create!(:name => "Test User C", :residence_id => 1)
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
  
  describe "roommates_string" do
    it "should produce a roommate string" do
      @user = User.create!(@valid_attributes)
      @user.roommates_string.should == "Test User A, Test User B, Test User C"
    end
  end
  
  describe "User.registerUser" do
    it "should create and save a new user" do
      @token = "a"
      @json = {:name => "Hello", :email => "a@a.com", :fb_id => 1}
      @user = User.create!(@valid_attributes)
      User.should_receive(:new).and_return(@user)
      @user.should_receive(:save!)
      User.registerUser(@json, @token)
    end
  end
end
