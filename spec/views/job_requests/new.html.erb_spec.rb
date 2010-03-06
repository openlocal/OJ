require 'spec_helper'

describe "/job_requests/new.html.erb" do
  include JobRequestsHelper

  before(:each) do
    assigns[:job_request] = stub_model(JobRequest,
      :new_record? => true,
      :title => "value for title",
      :description => "value for description",
      :location => "value for location",
      :duration => 1,
      :status => "value for status",
      :user => 1
    )
  end

  it "renders new job_request form" do
    render

    response.should have_tag("form[action=?][method=post]", job_requests_path) do
      with_tag("input#job_request_title[name=?]", "job_request[title]")
      with_tag("textarea#job_request_description[name=?]", "job_request[description]")
      with_tag("textarea#job_request_location[name=?]", "job_request[location]")
      with_tag("input#job_request_duration[name=?]", "job_request[duration]")
      with_tag("input#job_request_status[name=?]", "job_request[status]")
      with_tag("input#job_request_user[name=?]", "job_request[user]")
    end
  end
end
