require 'spec_helper'

describe "/help_offers/edit.html.erb" do
  include HelpOffersHelper

  before(:each) do
    assigns[:help_offer] = @help_offer = stub_model(HelpOffer,
      :new_record? => false,
      :user => 1,
      :job_request => 1,
      :comment => "value for comment",
      :accepted => false,
      :response => "value for response"
    )
  end

  it "renders the edit help_offer form" do
    render

    response.should have_tag("form[action=#{help_offer_path(@help_offer)}][method=post]") do
      with_tag('input#help_offer_user[name=?]', "help_offer[user]")
      with_tag('input#help_offer_job_request[name=?]', "help_offer[job_request]")
      with_tag('textarea#help_offer_comment[name=?]', "help_offer[comment]")
      with_tag('input#help_offer_accepted[name=?]', "help_offer[accepted]")
      with_tag('textarea#help_offer_response[name=?]', "help_offer[response]")
    end
  end
end
