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

end
