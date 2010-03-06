require 'spec_helper'

describe JobRequest do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :description => "value for description",
      :location => "value for location",
      :start_at => Time.now,
      :end_at => Time.now,
      :duration => 1,
      :status => "value for status",
      :user_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    JobRequest.create!(@valid_attributes)
  end
end
