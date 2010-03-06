require 'spec_helper'

describe HelpOffer do
  describe '.create' do
    it "should send an email to the job requester" do
      offer = HelpOffer.make
      
      ActionMailer::Base.deliveries.detect { |mail|
        mail.to.include?(offer.job_request.user.email)
      }.should_not be_nil
    end
  end
  describe '#save' do
    it "should send an email when approved is set to true" do
      offer = HelpOffer.make :accepted => false
      offer.accepted = true
      offer.save
      
      ActionMailer::Base.deliveries.detect { |mail|
        mail.to.include?(offer.user.email)
      }.should_not be_nil
    end
    it "should not send emails when other changes are made" do
       offer = HelpOffer.make
       offer.comment = "whatever"
       offer.save
       
       ActionMailer::Base.deliveries.detect { |mail|
         mail.to.include?(offer.user.email)
       }.should be_nil
    end
  end
end
