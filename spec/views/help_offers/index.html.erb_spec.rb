require 'spec_helper'

describe "/help_offers/index.html.erb" do
  include HelpOffersHelper

  before(:each) do
    assigns[:help_offers] = [
      stub_model(HelpOffer,
        :user => 1,
        :job_request => 1,
        :comment => "value for comment",
        :accepted => false,
        :response => "value for response"
      ),
      stub_model(HelpOffer,
        :user => 1,
        :job_request => 1,
        :comment => "value for comment",
        :accepted => false,
        :response => "value for response"
      )
    ]
  end

  it "renders a list of help_offers" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for comment".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", "value for response".to_s, 2)
  end
end
