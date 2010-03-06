require 'spec_helper'

describe JobRequestsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/job_requests" }.should route_to(:controller => "job_requests", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/job_requests/new" }.should route_to(:controller => "job_requests", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/job_requests/1" }.should route_to(:controller => "job_requests", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/job_requests/1/edit" }.should route_to(:controller => "job_requests", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/job_requests" }.should route_to(:controller => "job_requests", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/job_requests/1" }.should route_to(:controller => "job_requests", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/job_requests/1" }.should route_to(:controller => "job_requests", :action => "destroy", :id => "1") 
    end
  end
end
