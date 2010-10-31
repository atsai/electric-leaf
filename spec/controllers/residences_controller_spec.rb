require 'spec_helper'

describe ResidencesController do
  
  before(:each) do
    controller.stub!(:logged_in?).and_return(true)
  end

  def mock_residence(stubs={})
    @mock_residence ||= mock_model(Residence, stubs)
  end

  describe "GET index" do
    it "assigns all residences as @residences" do
      Residence.stub(:find).with(:all).and_return([mock_residence])
      get :index
      assigns[:residences].should == [mock_residence]
    end
  end

  describe "GET show" do
    it "assigns the requested residence as @residence" do
      Residence.stub(:find).with("37").and_return(mock_residence)
      get :show, :id => "37"
      assigns[:residence].should equal(mock_residence)
    end
  end

  describe "GET new" do
    it "assigns a new residence as @residence" do
      Residence.stub(:new).and_return(mock_residence)
      get :new
      assigns[:residence].should equal(mock_residence)
    end
  end

  describe "GET edit" do
    it "assigns the requested residence as @residence" do
      Residence.stub(:find).with("37").and_return(mock_residence)
      get :edit, :id => "37"
      assigns[:residence].should equal(mock_residence)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created residence as @residence" do
        Residence.stub(:new).with({'these' => 'params'}).and_return(mock_residence(:save => true))
        post :create, :residence => {:these => 'params'}
        assigns[:residence].should equal(mock_residence)
      end

      it "redirects to the created residence" do
        Residence.stub(:new).and_return(mock_residence(:save => true))
        post :create, :residence => {}
        response.should redirect_to(residence_url(mock_residence))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved residence as @residence" do
        Residence.stub(:new).with({'these' => 'params'}).and_return(mock_residence(:save => false))
        post :create, :residence => {:these => 'params'}
        assigns[:residence].should equal(mock_residence)
      end

      it "re-renders the 'new' template" do
        Residence.stub(:new).and_return(mock_residence(:save => false))
        post :create, :residence => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested residence" do
        Residence.should_receive(:find).with("37").and_return(mock_residence)
        mock_residence.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :residence => {:these => 'params'}
      end

      it "assigns the requested residence as @residence" do
        Residence.stub(:find).and_return(mock_residence(:update_attributes => true))
        put :update, :id => "1"
        assigns[:residence].should equal(mock_residence)
      end

      it "redirects to the residence" do
        Residence.stub(:find).and_return(mock_residence(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(residence_url(mock_residence))
      end
    end

    describe "with invalid params" do
      it "updates the requested residence" do
        Residence.should_receive(:find).with("37").and_return(mock_residence)
        mock_residence.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :residence => {:these => 'params'}
      end

      it "assigns the residence as @residence" do
        Residence.stub(:find).and_return(mock_residence(:update_attributes => false))
        put :update, :id => "1"
        assigns[:residence].should equal(mock_residence)
      end

      it "re-renders the 'edit' template" do
        Residence.stub(:find).and_return(mock_residence(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested residence" do
      Residence.should_receive(:find).with("37").and_return(mock_residence)
      mock_residence.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the residences list" do
      Residence.stub(:find).and_return(mock_residence(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(residences_url)
    end
  end

end
