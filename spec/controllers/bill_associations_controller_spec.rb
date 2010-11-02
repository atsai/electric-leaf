require 'spec_helper'

describe BillAssociationsController do

  def mock_bill_association(stubs={})
    @mock_bill_association ||= mock_model(BillAssociation, stubs)
  end

  describe "GET index" do
    it "assigns all bill_associations as @bill_associations" do
      BillAssociation.stub(:find).with(:all).and_return([mock_bill_association])
      get :index
      assigns[:bill_associations].should == [mock_bill_association]
    end
  end

  describe "GET show" do
    it "assigns the requested bill_association as @bill_association" do
      BillAssociation.stub(:find).with("37").and_return(mock_bill_association)
      get :show, :id => "37"
      assigns[:bill_association].should equal(mock_bill_association)
    end
  end

  describe "GET new" do
    it "assigns a new bill_association as @bill_association" do
      BillAssociation.stub(:new).and_return(mock_bill_association)
      get :new
      assigns[:bill_association].should equal(mock_bill_association)
    end
  end

  describe "GET edit" do
    it "assigns the requested bill_association as @bill_association" do
      BillAssociation.stub(:find).with("37").and_return(mock_bill_association)
      get :edit, :id => "37"
      assigns[:bill_association].should equal(mock_bill_association)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created bill_association as @bill_association" do
        BillAssociation.stub(:new).with({'these' => 'params'}).and_return(mock_bill_association(:save => true))
        post :create, :bill_association => {:these => 'params'}
        assigns[:bill_association].should equal(mock_bill_association)
      end

      it "redirects to the created bill_association" do
        BillAssociation.stub(:new).and_return(mock_bill_association(:save => true))
        post :create, :bill_association => {}
        response.should redirect_to(bill_association_url(mock_bill_association))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved bill_association as @bill_association" do
        BillAssociation.stub(:new).with({'these' => 'params'}).and_return(mock_bill_association(:save => false))
        post :create, :bill_association => {:these => 'params'}
        assigns[:bill_association].should equal(mock_bill_association)
      end

      it "re-renders the 'new' template" do
        BillAssociation.stub(:new).and_return(mock_bill_association(:save => false))
        post :create, :bill_association => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested bill_association" do
        BillAssociation.should_receive(:find).with("37").and_return(mock_bill_association)
        mock_bill_association.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :bill_association => {:these => 'params'}
      end

      it "assigns the requested bill_association as @bill_association" do
        BillAssociation.stub(:find).and_return(mock_bill_association(:update_attributes => true))
        put :update, :id => "1"
        assigns[:bill_association].should equal(mock_bill_association)
      end

      it "redirects to the bill_association" do
        BillAssociation.stub(:find).and_return(mock_bill_association(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(bill_association_url(mock_bill_association))
      end
    end

    describe "with invalid params" do
      it "updates the requested bill_association" do
        BillAssociation.should_receive(:find).with("37").and_return(mock_bill_association)
        mock_bill_association.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :bill_association => {:these => 'params'}
      end

      it "assigns the bill_association as @bill_association" do
        BillAssociation.stub(:find).and_return(mock_bill_association(:update_attributes => false))
        put :update, :id => "1"
        assigns[:bill_association].should equal(mock_bill_association)
      end

      it "re-renders the 'edit' template" do
        BillAssociation.stub(:find).and_return(mock_bill_association(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested bill_association" do
      BillAssociation.should_receive(:find).with("37").and_return(mock_bill_association)
      mock_bill_association.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the bill_associations list" do
      BillAssociation.stub(:find).and_return(mock_bill_association(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(bill_associations_url)
    end
  end

end
