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
end
