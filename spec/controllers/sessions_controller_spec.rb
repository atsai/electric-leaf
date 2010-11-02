require 'spec_helper'
require 'ostruct'

describe SessionsController do

  before(:each) do
    User.stub!(:facebook_client).and_return(OAuth2::Client.new(0, 0, :site=> "https://graph.facebook.com"))
  end

  describe "facebook_oauth_new" do
    it "redirects webpage to facebook login screen" do
      get :facebook_oauth_new 
      response.should redirect_to("https://graph.facebook.com/oauth/authorize?scope=email&client_id=0&type=web_server&redirect_uri=http%3A%2F%2Ftest.host%2Fsessions%2Ffacebook_oauth_callback")
    end
  end
  
  describe "facebook_oauth_callback" do
    #it "should receive facebook oauth token" do
      #controller.stub!(:params).and_return({:code=>'token'})
      #user = User.new(:name=>"username", :email=>"email", :residence_id=>1)
      #User.stub!(:find_by_id).and_return(user)
      #get :facebook_oauth_callback
      #response.should redirect_to("/")
    #end
    it "should receive facebook oauth token" do
      @mock_token = OpenStruct.new({"token" => 1})
      @mock_fb_client = "Hello"
      @mock_web_server = "Hello"
      User.stub!(:facebook_client).and_return(@mock_fb_client)
      @mock_fb_client.stub!(:web_server).and_return(@mock_web_server)
      @mock_web_server.stub!(:authorize_url).and_return 1
      User.facebook_client.web_server.stub!(:get_access_token).and_return(@mock_token)
      User.stub!(:login).and_return(1)
      get :facebook_oauth_callback, :code => 1
      response.should redirect_to("/")
    end
    it "should redirect webpage to root page" do
      get :facebook_oauth_callback
      response.should redirect_to("/")
    end
  end

  describe "logout" do
    it "should clear the user's session id" do
      get :logout
      session[:user_id].should == nil 
    end
  end
end
