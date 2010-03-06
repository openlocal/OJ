require 'spec_helper'

describe JobRequestsController do

  def mock_job_request(stubs={})
    @mock_job_request ||= mock_model(JobRequest, stubs)
  end

  describe "GET index" do
    it "assigns all job_requests as @job_requests" do
      JobRequest.stub!(:find).with(:all).and_return([mock_job_request])
      get :index
      assigns[:job_requests].should == [mock_job_request]
    end
  end

  describe "GET show" do
    it "assigns the requested job_request as @job_request" do
      JobRequest.stub!(:find).with("37").and_return(mock_job_request)
      get :show, :id => "37"
      assigns[:job_request].should equal(mock_job_request)
    end
  end

  describe "GET new" do
    it "assigns a new job_request as @job_request" do
      JobRequest.stub!(:new).and_return(mock_job_request)
      get :new
      assigns[:job_request].should equal(mock_job_request)
    end
  end

  describe "GET edit" do
    it "assigns the requested job_request as @job_request" do
      JobRequest.stub!(:find).with("37").and_return(mock_job_request)
      get :edit, :id => "37"
      assigns[:job_request].should equal(mock_job_request)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created job_request as @job_request" do
        JobRequest.stub!(:new).with({'these' => 'params'}).and_return(mock_job_request(:save => true))
        post :create, :job_request => {:these => 'params'}
        assigns[:job_request].should equal(mock_job_request)
      end

      it "redirects to the created job_request" do
        JobRequest.stub!(:new).and_return(mock_job_request(:save => true))
        post :create, :job_request => {}
        response.should redirect_to(job_request_url(mock_job_request))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved job_request as @job_request" do
        JobRequest.stub!(:new).with({'these' => 'params'}).and_return(mock_job_request(:save => false))
        post :create, :job_request => {:these => 'params'}
        assigns[:job_request].should equal(mock_job_request)
      end

      it "re-renders the 'new' template" do
        JobRequest.stub!(:new).and_return(mock_job_request(:save => false))
        post :create, :job_request => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested job_request" do
        JobRequest.should_receive(:find).with("37").and_return(mock_job_request)
        mock_job_request.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :job_request => {:these => 'params'}
      end

      it "assigns the requested job_request as @job_request" do
        JobRequest.stub!(:find).and_return(mock_job_request(:update_attributes => true))
        put :update, :id => "1"
        assigns[:job_request].should equal(mock_job_request)
      end

      it "redirects to the job_request" do
        JobRequest.stub!(:find).and_return(mock_job_request(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(job_request_url(mock_job_request))
      end
    end

    describe "with invalid params" do
      it "updates the requested job_request" do
        JobRequest.should_receive(:find).with("37").and_return(mock_job_request)
        mock_job_request.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :job_request => {:these => 'params'}
      end

      it "assigns the job_request as @job_request" do
        JobRequest.stub!(:find).and_return(mock_job_request(:update_attributes => false))
        put :update, :id => "1"
        assigns[:job_request].should equal(mock_job_request)
      end

      it "re-renders the 'edit' template" do
        JobRequest.stub!(:find).and_return(mock_job_request(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested job_request" do
      JobRequest.should_receive(:find).with("37").and_return(mock_job_request)
      mock_job_request.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the job_requests list" do
      JobRequest.stub!(:find).and_return(mock_job_request(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(job_requests_url)
    end
  end

end
