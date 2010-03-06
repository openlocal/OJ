class Feedback < ActiveRecord::Base
  belongs_to :job_request
  belongs_to :help_offer
  
  validates_presence_of :job_request, :help_offer
  
  before_validation_on_create :set_help_offer
  after_create :set_job_to_complete
  after_create :send_feedback_to_help_offerer
  
  private
  
  def set_job_to_complete
    job_request.complete!
  end
  
  def set_help_offer
    self.help_offer ||= job_request.help_offers.detect { |offer|
      offer.accepted
    }
  end
  
  def send_feedback_to_help_offerer
    Notifications.deliver_feedback self
  end
end
