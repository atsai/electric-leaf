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
    @json = {:name => "Hello", :email => "a@a.com", :fb_id => 1}
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
      @user = User.create!(@valid_attributes)
      User.should_receive(:new).and_return(@user)
      @user.should_receive(:save!)
      User.registerUser(@json, @token)
    end
  end

  describe "User.login" do
    it "fetch new user's facebook information" do
      User.stub!(:facebook_client).and_return(OAuth2::Client.new(0, 0, :site=> "https://graph.facebook.com"))
      OAuth2::AccessToken.stub!(:new).and_return(nil)
      nil.stub!(:get).and_return(nil)
      JSON.stub!(:parse).and_return(@json)
      User.login("token").should == 1
    end
    it "updates user's facebook information if user already in database" do
      User.stub!(:facebook_client).and_return(OAuth2::Client.new(0, 0, :site=> "https://graph.facebook.com"))
      OAuth2::AccessToken.stub!(:new).and_return(nil)
      nil.stub!(:get).and_return(nil)
      JSON.stub!(:parse).and_return(@json)
      User.stub!(:find_by_fb_id).and_return(nil)
      User.login("token").should == 4
    end
  end

  describe "User.facebook_client" do
    it "should create a facebook_client object using OAuth2 gem" do
      User::FACEBOOK_OAUTH_APP_ID = 0
      User::FACEBOOK_OAUTH_APP_SECRET = 0
      User.facebook_client
    end
  end
end
