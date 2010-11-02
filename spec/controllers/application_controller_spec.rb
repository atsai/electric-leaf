require 'spec_helper'

describe ApplicationController do

  describe "index" do
    it "should setup instance variable for view if user is logged in" do
      session[:user_id] = 1
      user = mock(User)
      user.stub!(:name=>'name', :email=>'email')
      User.stub!(:find_by_id).and_return(user)
      get :index
    end
  end
  
  # Tests for requiring logins are in the chore_specs

end

# Use ChoreController to test requiring logins

describe ChoresController do
  
  before(:each) do
    @residence = Residence.create!
    @user = User.create!(:name => "User A", :residence_id => 1)
    User.stub!(:find_by_id).and_return(@user)
  end
  
  describe "require_login" do
    it "should redirect users who are not logged in" do
      Rails.env.stub!(:test?).and_return(false)
      session[:user_id] = nil
      get :index
      response.should redirect_to(root_url)
    end
    
    it "should not redirect users who are logged in" do
      Rails.env.stub!(:test?).and_return(false)
      session[:user_id] = 1
      get :index
      response.should_not redirect_to(root_url)
    end
    
    it "should not redirect any users in the test environment" do
      session[:user_id] = nil
      get :index
      response.should_not redirect_to(root_url)
    end
  end
      
end