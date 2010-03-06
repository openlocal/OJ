require 'spec_helper'

describe "/job_requests/show.html.erb" do
  include JobRequestsHelper
  before(:each) do
    assigns[:job_request] = @job_request = stub_model(JobRequest,
      :title => "value for title",
      :description => "value for description",
      :location => "value for location",
      :duration => 1,
      :status => "value for status",
      :user => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/value\ for\ location/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ status/)
    response.should have_text(/1/)
  end
end
