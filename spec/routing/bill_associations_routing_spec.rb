require 'spec_helper'

describe BillAssociationsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/bill_associations" }.should route_to(:controller => "bill_associations", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/bill_associations/new" }.should route_to(:controller => "bill_associations", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/bill_associations/1" }.should route_to(:controller => "bill_associations", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/bill_associations/1/edit" }.should route_to(:controller => "bill_associations", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/bill_associations" }.should route_to(:controller => "bill_associations", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/bill_associations/1" }.should route_to(:controller => "bill_associations", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/bill_associations/1" }.should route_to(:controller => "bill_associations", :action => "destroy", :id => "1") 
    end
  end
end
