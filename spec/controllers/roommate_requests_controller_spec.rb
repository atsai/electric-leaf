require 'spec_helper'

describe RoommateRequestsController do

  def mock_roommate_request(stubs={})
    @mock_roommate_request ||= mock_model(RoommateRequest, stubs)
  end

  describe "GET index" do
    it "assigns all roommate_requests as @roommate_requests" do
      RoommateRequest.stub(:find).with(:all).and_return([mock_roommate_request])
      get :index
      assigns[:roommate_requests].should == [mock_roommate_request]
    end
  end

  describe "GET show" do
    it "assigns the requested roommate_request as @roommate_request" do
      RoommateRequest.stub(:find).with("37").and_return(mock_roommate_request)
      get :show, :id => "37"
      assigns[:roommate_request].should equal(mock_roommate_request)
    end
  end

  describe "GET new" do
    it "assigns a new roommate_request as @roommate_request" do
      RoommateRequest.stub(:new).and_return(mock_roommate_request)
      get :new
      assigns[:roommate_request].should equal(mock_roommate_request)
    end
  end

  describe "GET edit" do
    it "assigns the requested roommate_request as @roommate_request" do
      RoommateRequest.stub(:find).with("37").and_return(mock_roommate_request)
      get :edit, :id => "37"
      assigns[:roommate_request].should equal(mock_roommate_request)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created roommate_request as @roommate_request" do
        RoommateRequest.stub(:new).with({'these' => 'params'}).and_return(mock_roommate_request(:save => true))
        post :create, :roommate_request => {:these => 'params'}
        assigns[:roommate_request].should equal(mock_roommate_request)
      end

      it "redirects to the created roommate_request" do
        RoommateRequest.stub(:new).and_return(mock_roommate_request(:save => true))
        post :create, :roommate_request => {}
        response.should redirect_to(roommate_request_url(mock_roommate_request))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved roommate_request as @roommate_request" do
        RoommateRequest.stub(:new).with({'these' => 'params'}).and_return(mock_roommate_request(:save => false))
        post :create, :roommate_request => {:these => 'params'}
        assigns[:roommate_request].should equal(mock_roommate_request)
      end

      it "re-renders the 'new' template" do
        RoommateRequest.stub(:new).and_return(mock_roommate_request(:save => false))
        post :create, :roommate_request => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested roommate_request" do
        RoommateRequest.should_receive(:find).with("37").and_return(mock_roommate_request)
        mock_roommate_request.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :roommate_request => {:these => 'params'}
      end

      it "assigns the requested roommate_request as @roommate_request" do
        RoommateRequest.stub(:find).and_return(mock_roommate_request(:update_attributes => true))
        put :update, :id => "1"
        assigns[:roommate_request].should equal(mock_roommate_request)
      end

      it "redirects to the roommate_request" do
        RoommateRequest.stub(:find).and_return(mock_roommate_request(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(roommate_request_url(mock_roommate_request))
      end
    end

    describe "with invalid params" do
      it "updates the requested roommate_request" do
        RoommateRequest.should_receive(:find).with("37").and_return(mock_roommate_request)
        mock_roommate_request.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :roommate_request => {:these => 'params'}
      end

      it "assigns the roommate_request as @roommate_request" do
        RoommateRequest.stub(:find).and_return(mock_roommate_request(:update_attributes => false))
        put :update, :id => "1"
        assigns[:roommate_request].should equal(mock_roommate_request)
      end

      it "re-renders the 'edit' template" do
        RoommateRequest.stub(:find).and_return(mock_roommate_request(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested roommate_request" do
      RoommateRequest.should_receive(:find).with("37").and_return(mock_roommate_request)
      mock_roommate_request.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the roommate_requests list" do
      RoommateRequest.stub(:find).and_return(mock_roommate_request(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(roommate_requests_url)
    end
  end

end
