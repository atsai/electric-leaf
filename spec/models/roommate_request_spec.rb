require 'spec_helper'

describe RoommateRequest do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :requester_id => 1,
      :status => 1
    }
    @requester = User.create!(:name => "Test User A", :residence_id => 1)
  end

  it "should create a new instance given valid attributes" do
    RoommateRequest.create!(@valid_attributes)
  end
  
  describe "requester" do
    it "should return the requester's User object" do
      @req = RoommateRequest.create!(:user_id => 100, :requester_id => @requester.id, :status => 0)
      @req.requester.should == @requester
    end
  end
  
  describe "requester_name" do
    it "should return the requester's name" do
      @req = RoommateRequest.create!(:user_id => 100, :requester_id => @requester.id, :status => 0)
      @req.requester_name.should == "Test User A"
    end
  end
end
