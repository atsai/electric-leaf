require 'spec_helper'

describe ChoreAssociationsController do
  
  before(:each) do
    controller.stub!(:logged_in?).and_return(true)
  end

  def mock_chore_association(stubs={})
    @mock_chore_association ||= mock_model(ChoreAssociation, stubs)
  end

  describe "GET index" do
    it "assigns all chore_associations as @chore_associations" do
      ChoreAssociation.stub(:find).with(:all).and_return([mock_chore_association])
      get :index
      assigns[:chore_associations].should == [mock_chore_association]
    end
  end

  describe "GET show" do
    it "assigns the requested chore_association as @chore_association" do
      ChoreAssociation.stub(:find).with("37").and_return(mock_chore_association)
      get :show, :id => "37"
      assigns[:chore_association].should equal(mock_chore_association)
    end
  end

  describe "GET new" do
    it "assigns a new chore_association as @chore_association" do
      ChoreAssociation.stub(:new).and_return(mock_chore_association)
      get :new
      assigns[:chore_association].should equal(mock_chore_association)
    end
  end

  describe "GET edit" do
    it "assigns the requested chore_association as @chore_association" do
      ChoreAssociation.stub(:find).with("37").and_return(mock_chore_association)
      get :edit, :id => "37"
      assigns[:chore_association].should equal(mock_chore_association)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created chore_association as @chore_association" do
        ChoreAssociation.stub(:new).with({'these' => 'params'}).and_return(mock_chore_association(:save => true))
        post :create, :chore_association => {:these => 'params'}
        assigns[:chore_association].should equal(mock_chore_association)
      end

      it "redirects to the created chore_association" do
        ChoreAssociation.stub(:new).and_return(mock_chore_association(:save => true))
        post :create, :chore_association => {}
        response.should redirect_to(chore_association_url(mock_chore_association))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved chore_association as @chore_association" do
        ChoreAssociation.stub(:new).with({'these' => 'params'}).and_return(mock_chore_association(:save => false))
        post :create, :chore_association => {:these => 'params'}
        assigns[:chore_association].should equal(mock_chore_association)
      end

      it "re-renders the 'new' template" do
        ChoreAssociation.stub(:new).and_return(mock_chore_association(:save => false))
        post :create, :chore_association => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested chore_association" do
        ChoreAssociation.should_receive(:find).with("37").and_return(mock_chore_association)
        mock_chore_association.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :chore_association => {:these => 'params'}
      end

      it "assigns the requested chore_association as @chore_association" do
        ChoreAssociation.stub(:find).and_return(mock_chore_association(:update_attributes => true))
        put :update, :id => "1"
        assigns[:chore_association].should equal(mock_chore_association)
      end

      it "redirects to the chore_association" do
        ChoreAssociation.stub(:find).and_return(mock_chore_association(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(chore_association_url(mock_chore_association))
      end
    end

    describe "with invalid params" do
      it "updates the requested chore_association" do
        ChoreAssociation.should_receive(:find).with("37").and_return(mock_chore_association)
        mock_chore_association.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :chore_association => {:these => 'params'}
      end

      it "assigns the chore_association as @chore_association" do
        ChoreAssociation.stub(:find).and_return(mock_chore_association(:update_attributes => false))
        put :update, :id => "1"
        assigns[:chore_association].should equal(mock_chore_association)
      end

      it "re-renders the 'edit' template" do
        ChoreAssociation.stub(:find).and_return(mock_chore_association(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested chore_association" do
      ChoreAssociation.should_receive(:find).with("37").and_return(mock_chore_association)
      mock_chore_association.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the chore_associations list" do
      ChoreAssociation.stub(:find).and_return(mock_chore_association(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(chore_associations_url)
    end
  end

end
