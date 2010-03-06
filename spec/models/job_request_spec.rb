require 'spec_helper'

describe JobRequest do
  describe '.create' do
    it "should create a user account for the given email address" do
      JobRequest.make :email_address => 'test@domain.com', :user => nil
      User.find_by_email('test@domain.com').should_not be_nil
    end
  end
  
  describe '#open!' do
    before :each do
      @job = JobRequest.make(:status => 'Pending')
      @job.open!
    end
    
    it "should set the status to open" do
      @job.status.should == 'Open'
    end
    
    it "should save the changes" do
      @job.should_not be_changed
    end
  end
end
