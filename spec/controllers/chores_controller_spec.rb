require 'spec_helper'

describe ChoresController do
  
  before(:each) do
    @residence = Residence.create!
    @user = User.create!(:name => "Test User", :residence_id => 1)
    User.stub!(:find_by_id).and_return(@user)
    controller.stub!(:logged_in?).and_return(true)
  end

  def mock_chore(stubs={})
    @mock_chore ||= mock_model(Chore, stubs)
    @mock_chore.stub!(:residence).and_return(@residence)
    @mock_chore.stub!(:deadline).and_return(Time.now)
    @mock_chore.stub!(:is_done=)
    @mock_chore.stub!(:is_done)
    @mock_chore.stub!(:title).and_return("Title")
    @mock_chore.stub!(:sorted_users_string).and_return("Test User")
    @mock_chore
  end

  describe "GET index" do
    it "assigns all chores as @chores" do
      Chore.stub(:find_all_by_residence_id).and_return([mock_chore])
      get :index
      assigns[:chores].should == [mock_chore]
    end
  end

  describe "GET show" do
    it "assigns the requested chore as @chore" do
      Chore.stub(:find).with("37").and_return(mock_chore)
      get :show, :id => "37"
      assigns[:chore].should equal(mock_chore)
    end
  end

  describe "GET new" do
    it "assigns a new chore as @chore" do
      Chore.stub(:new).and_return(mock_chore)
      get :new
      assigns[:chore].should equal(mock_chore)
    end
  end

  describe "GET edit" do
    it "assigns the requested chore as @chore" do
      Chore.stub(:find).with("37").and_return(mock_chore)
      get :edit, :id => "37"
      assigns[:chore].should equal(mock_chore)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created chore as @chore" do
        Chore.stub(:new).with({'these' => 'params'}).and_return(mock_chore(:save => true))
        post :create, :chore => {:these => 'params'}
        assigns[:chore].should equal(mock_chore)
      end

      it "redirects to the chores list" do
        Chore.stub(:new).and_return(mock_chore(:save => true))
        post :create, :chore => {}
        response.should redirect_to(chores_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved chore as @chore" do
        Chore.stub(:new).with({'these' => 'params'}).and_return(mock_chore(:save => false))
        post :create, :chore => {:these => 'params'}
        assigns[:chore].should equal(mock_chore)
      end

      it "re-renders the 'new' template" do
        Chore.stub(:new).and_return(mock_chore(:save => false))
        post :create, :chore => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested chore" do
        Chore.should_receive(:find).twice.with("37").and_return(mock_chore)
        mock_chore.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :chore => {:these => 'params'}
      end

      it "assigns the requested chore as @chore" do
        Chore.stub(:find).and_return(mock_chore(:update_attributes => true))
        put :update, :id => "1"
        assigns[:chore].should equal(mock_chore)
      end

      it "redirects to the chores list" do
        Chore.stub(:find).and_return(mock_chore(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(chores_url)
      end
    end

    describe "with invalid params" do
      it "updates the requested chore" do
        Chore.should_receive(:find).twice.with("37").and_return(mock_chore)
        mock_chore.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :chore => {:these => 'params'}
      end

      it "assigns the chore as @chore" do
        Chore.stub(:find).and_return(mock_chore(:update_attributes => false))
        put :update, :id => "1"
        assigns[:chore].should equal(mock_chore)
      end

      it "re-renders the 'edit' template" do
        Chore.stub(:find).and_return(mock_chore(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested chore" do
      Chore.should_receive(:find).twice.with("37").and_return(mock_chore)
      mock_chore.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the chores list" do
      Chore.stub(:find).and_return(mock_chore(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(chores_url)
    end
  end
  
  describe "Checkoff" do
    it "checks off the requested chore" do
      Chore.should_receive(:find).with("37").and_return(mock_chore)
      mock_chore.should_receive(:is_done=).with(true)
      mock_chore.should_receive(:save)
      put :checkoff, :id => "37"
    end
  end
  
  describe "Require ownership" do
    it "does not allow the user to see the chore if the user does not own the chore" do
      controller.stub!(:owns_chore?).and_return(false)
      Chore.stub(:find).with("37").and_return(mock_chore)
      get :show, :id => "37"
      response.should redirect_to(chores_url)
    end
    
    it "does not allow the user to edit the chore if the user does not own the chore" do
      controller.stub!(:owns_chore?).and_return(false)
      Chore.stub(:find).with("37").and_return(mock_chore)
      get :edit, :id => "37"
      response.should redirect_to(chores_url)
    end
    
    it "does not allow the user to update the chore if the user does not own the chore" do
      controller.stub!(:owns_chore?).and_return(false)
      Chore.stub(:find).with("37").and_return(mock_chore)
      put :update, :id => "37", :chore => {:these => 'params'}
      response.should redirect_to(chores_url)
    end

    it "does not allow the user to destroy the chore if the user does not own the chore" do
      controller.stub!(:owns_chore?).and_return(false)
      Chore.stub(:find).with("37").and_return(mock_chore)
      delete :destroy, :id => "37"
      response.should redirect_to(chores_url)
    end
  end
end
