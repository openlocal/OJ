require 'spec_helper'

describe HelpOffer do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :job_request_id => 1,
      :comment => "value for comment",
      :accepted => false,
      :response => "value for response"
    }
  end

  it "should create a new instance given valid attributes" do
    HelpOffer.create!(@valid_attributes)
  end
end
