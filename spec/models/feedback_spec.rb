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
    
    it "should send an email to the help offerer" do
      job   = JobRequest.make :status => 'offered'
      offer = HelpOffer.make :job_request => job, :accepted => true
      
      Feedback.make :job_request => job, :help_offer => offer
      
      ActionMailer::Base.deliveries.detect { |mail|
        mail.to.include?(offer.user.email) &&
        mail.subject == 'Job Completion Feedback'
      }.should_not be_nil
    end
  end
end
