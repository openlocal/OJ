require 'spec_helper'

describe Feedback do
  describe '.create' do
    it "should set the status of the job to complete" do
      job = JobRequest.make :status => 'offered'
      Feedback.make :job_request => job
      
      job.reload
      job.status.should == 'complete'
    end
    
    it "should set the help offer form the job" do
      job = JobRequest.make :status => 'offered'
      HelpOffer.make :job_request => job
      HelpOffer.make :job_request => job
      accepted_offer = HelpOffer.make :job_request => job, :accepted => true
      HelpOffer.make :job_request => job
      
      feedback = Feedback.make :job_request => job, :help_offer => nil
      feedback.help_offer.should == accepted_offer
    end
  end
end
