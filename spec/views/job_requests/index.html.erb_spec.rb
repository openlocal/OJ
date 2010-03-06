require 'spec_helper'

describe "/job_requests/index.html.erb" do
  include JobRequestsHelper

  before(:each) do
    assigns[:job_requests] = [
      stub_model(JobRequest,
        :title => "value for title",
        :description => "value for description",
        :location => "value for location",
        :duration => 1,
        :status => "value for status",
        :user => 1
      ),
      stub_model(JobRequest,
        :title => "value for title",
        :description => "value for description",
        :location => "value for location",
        :duration => 1,
        :status => "value for status",
        :user => 1
      )
    ]
  end

  it "renders a list of job_requests" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", "value for location".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for status".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
