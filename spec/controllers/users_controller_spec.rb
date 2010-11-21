require 'spec_helper'

describe UsersController do
  
  before(:each) do
    controller.stub!(:logged_in?).and_return(true)
    @residence = Residence.create!
    @residence2 = Residence.create!
  end

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs)
    @mock_user.stub!(:residence).and_return(@residence)
    @mock_user.stub!(:roommates_string).and_return("Test User")
    @mock_user.stub!(:email).and_return("test@test.com")
    @mock_user
  end
  
  def mock_other_user(stubs={})
    @mock_other_user ||= mock_model(User, stubs)
    @mock_other_user.stub!(:name).and_return("Other User")
    @mock_other_user.stub!(:residence).and_return(@residence2)
    @mock_other_user.stub!(:roommates_string).and_return("Test User 2")
    @mock_other_user.stub!(:email).and_return("other@test.com")
    @mock_other_user
  end

  describe "GET index" do
    it "assigns all users as @users" do
      User.stub(:find).with(:all).and_return([mock_user])
      get :index
      assigns[:users].should == [mock_user]
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      User.stub(:find).with("37").and_return(mock_user)
      get :show, :id => "37"
      assigns[:user].should equal(mock_user)
    end
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      User.stub(:new).and_return(mock_user)
      get :new
      assigns[:user].should equal(mock_user)
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      User.stub(:find).with("37").and_return(mock_user)
      get :edit, :id => "37"
      assigns[:user].should equal(mock_user)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created user as @user" do
        User.stub(:new).with({'these' => 'params'}).and_return(mock_user(:save => true))
        post :create, :user => {:these => 'params'}
        assigns[:user].should equal(mock_user)
      end

      it "redirects to the created user" do
        User.stub(:new).and_return(mock_user(:save => true))
        post :create, :user => {}
        response.should redirect_to(user_url(mock_user))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        User.stub(:new).with({'these' => 'params'}).and_return(mock_user(:save => false))
        post :create, :user => {:these => 'params'}
        assigns[:user].should equal(mock_user)
      end

      it "re-renders the 'new' template" do
        User.stub(:new).and_return(mock_user(:save => false))
        post :create, :user => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested user" do
        User.should_receive(:find).with("37").and_return(mock_user)
        mock_user.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :user => {:these => 'params'}
      end

      it "assigns the requested user as @user" do
        User.stub(:find).and_return(mock_user(:update_attributes => true))
        put :update, :id => "1"
        assigns[:user].should equal(mock_user)
      end

      it "redirects to the user" do
        User.stub(:find).and_return(mock_user(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(user_url(mock_user))
      end
    end

    describe "with invalid params" do
      it "updates the requested user" do
        User.should_receive(:find).with("37").and_return(mock_user)
        mock_user.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :user => {:these => 'params'}
      end

      it "assigns the user as @user" do
        User.stub(:find).and_return(mock_user(:update_attributes => false))
        put :update, :id => "1"
        assigns[:user].should equal(mock_user)
      end

      it "re-renders the 'edit' template" do
        User.stub(:find).and_return(mock_user(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested user" do
      User.should_receive(:find).with("37").and_return(mock_user)
      mock_user.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the users list" do
      User.stub(:find).and_return(mock_user(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(users_url)
    end
  end
  
  describe "GET add_roommate" do
    it "assigns the requested user as @user" do
      User.stub(:find).with("37").and_return(mock_user)
      get :add_roommate, :id => "37"
      assigns[:user].should equal(mock_user)
    end
  end
  
  describe "PUT create_roommate_request" do

    describe "with valid params" do
      
      it "creates a roommate_request for the roommate (other user)" do
        User.should_receive(:find).with("37").and_return(mock_user)
        User.should_receive(:find_by_email).with("other@test.com").and_return(mock_other_user)
        mock_other_user.should_receive(:roommate_request)
        mock_other_user.should_receive(:roommate_request=)
        mock_other_user.should_receive(:save!)
        mock_other_user.should_receive(:name)
        put :create_roommate_request, :id => "37", :roommate_email => "other@test.com"
      end

      it "assigns the requested user as @user" do
        User.stub(:find).and_return(mock_user)
        put :create_roommate_request, :id => "1"
        assigns[:user].should equal(mock_user)
      end

      it "redirects to the root path" do
        User.should_receive(:find).with("37").and_return(mock_user)
        User.should_receive(:find_by_email).with("other@test.com").and_return(mock_other_user)
        mock_other_user.should_receive(:roommate_request)
        mock_other_user.should_receive(:roommate_request=)
        mock_other_user.should_receive(:save!)
        mock_other_user.should_receive(:name)
        put :create_roommate_request, :id => "37", :roommate_email => "other@test.com"
        response.should redirect_to(root_path)
      end
    end

    describe "with invalid params" do

      it "redirects to the add roommate page if user tries to add self" do
        User.stub(:find).and_return(mock_user)
        User.stub(:find_by_email).and_return(mock_user)
        put :create_roommate_request, :id => "1", :roommate_email => "test@test.com"
        response.should redirect_to(add_roommate_path)
      end
      
      it "redirects to the add roommate page if user tries to add unregistered roommate" do
        User.stub(:find).and_return(mock_user)
        User.stub(:find_by_email).and_return(nil)
        put :create_roommate_request, :id => "1", :roommate_email => "unregistered@test.com"
        response.should redirect_to(add_roommate_path)
      end
      
      it "redirects to the add roommate page if user tries to add a roommate with existing request" do
        User.stub(:find).and_return(mock_user)
        User.stub(:find_by_email).and_return(mock_other_user)
        mock_other_user.should_receive(:roommate_request).and_return(1)
        put :create_roommate_request, :id => "1", :roommate_email => "popularguy@test.com"
        response.should redirect_to(add_roommate_path)
      end
    end
    
  end
  
  describe "PUT accept_roommate_request" do
    it "adds the user to the requester's residence" do
      roommate_req = mock_model(RoommateRequest)
      roommate_req.stub!(:requester).and_return(mock_other_user)
      roommate_req.should_receive(:destroy)
      mock_user.should_receive(:roommate_request).at_least(1).times.and_return(roommate_req)
      mock_user.should_receive(:residence=).with(mock_other_user.residence)
      mock_user.should_receive(:save!)
      User.stub(:find).and_return(mock_user)
      put :accept_roommate_request, :id => "1"
      response.should redirect_to(root_path)
    end
  end
  
  describe "PUT deny_roommate_request" do
    it "destroys the roommate request" do
      roommate_req = mock_model(RoommateRequest)
      roommate_req.stub!(:requester).and_return(mock_other_user)
      roommate_req.should_receive(:destroy)
      mock_user.should_receive(:roommate_request).at_least(1).times.and_return(roommate_req)
      mock_user.should_receive(:save!)
      User.stub(:find).and_return(mock_user)
      put :deny_roommate_request, :id => "1"
      response.should redirect_to(root_path)
    end
  end
end
