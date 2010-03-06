require 'spec_helper'

describe "/help_offers/show.html.erb" do
  include HelpOffersHelper
  before(:each) do
    assigns[:help_offer] = @help_offer = stub_model(HelpOffer,
      :user => 1,
      :job_request => 1,
      :comment => "value for comment",
      :accepted => false,
      :response => "value for response"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ comment/)
    response.should have_text(/false/)
    response.should have_text(/value\ for\ response/)
  end
end
