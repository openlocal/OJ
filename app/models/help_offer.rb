class HelpOffer < ActiveRecord::Base
  belongs_to :user
  belongs_to :job_request
  
  after_create :send_notification
  after_save :send_acceptance_email
  
  private
  
  def send_notification
    Notifications.deliver_new_offer self
  end
  
  def send_acceptance_email
    return unless accepted_changed?
    
    from, to = accepted_change
    if to && !from
      Notifications.deliver_accepted_offer self
    end
  end
end
