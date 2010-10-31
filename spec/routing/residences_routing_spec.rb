require 'spec_helper'

describe ResidencesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/residences" }.should route_to(:controller => "residences", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/residences/new" }.should route_to(:controller => "residences", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/residences/1" }.should route_to(:controller => "residences", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/residences/1/edit" }.should route_to(:controller => "residences", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/residences" }.should route_to(:controller => "residences", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/residences/1" }.should route_to(:controller => "residences", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/residences/1" }.should route_to(:controller => "residences", :action => "destroy", :id => "1") 
    end
  end
end
