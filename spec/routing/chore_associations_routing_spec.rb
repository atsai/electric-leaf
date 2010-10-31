require 'spec_helper'

describe ChoreAssociationsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/chore_associations" }.should route_to(:controller => "chore_associations", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/chore_associations/new" }.should route_to(:controller => "chore_associations", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/chore_associations/1" }.should route_to(:controller => "chore_associations", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/chore_associations/1/edit" }.should route_to(:controller => "chore_associations", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/chore_associations" }.should route_to(:controller => "chore_associations", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/chore_associations/1" }.should route_to(:controller => "chore_associations", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/chore_associations/1" }.should route_to(:controller => "chore_associations", :action => "destroy", :id => "1") 
    end
  end
end
