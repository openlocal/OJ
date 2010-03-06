class HelpOffer < ActiveRecord::Base
  belongs_to :user
  belongs_to :job_request
end
