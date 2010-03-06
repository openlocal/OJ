require 'spec_helper'

describe HelpOffersController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/help_offers" }.should route_to(:controller => "help_offers", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/help_offers/new" }.should route_to(:controller => "help_offers", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/help_offers/1" }.should route_to(:controller => "help_offers", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/help_offers/1/edit" }.should route_to(:controller => "help_offers", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/help_offers" }.should route_to(:controller => "help_offers", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/help_offers/1" }.should route_to(:controller => "help_offers", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/help_offers/1" }.should route_to(:controller => "help_offers", :action => "destroy", :id => "1") 
    end
  end
end
