require 'spec_helper'

describe ConfirmationsController do
  describe '#new' do
    before :each do
      @user = User.make :email_confirmed => false
    end
    
    it "should redirect to the user's page if there are no open jobs" do
      get :new, :user_id => @user.id, :token => @user.confirmation_token
      
      response.should redirect_to(user_path(@user))
    end
    
    it "should redirect to the job's step 2 page if there is only one open job" do
      job = JobRequest.make :user => @user
      get :new, :user_id => @user.id, :token => @user.confirmation_token

      response.should redirect_to(step2_job_request_path(job))
    end
    
    it "should redirect to the user's page if there is more than one open job" do
      JobRequest.make :user => @user
      JobRequest.make :user => @user
      get :new, :user_id => @user.id, :token => @user.confirmation_token

      response.should redirect_to(user_path(@user))
    end
  end
end
