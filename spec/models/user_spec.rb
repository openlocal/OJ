require 'spec_helper'

describe User do
  describe '.create' do
    it "should generate a password if one isn't given" do
      user = User.create :email => 'test@domain.com'
      user.password.should_not be_nil
    end
  end
end
