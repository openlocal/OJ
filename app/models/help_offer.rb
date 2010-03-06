class HelpOffer < ActiveRecord::Base
  belongs_to :user
  belongs_to :job_request
  
  after_create :send_notification
  
  private
  
  def send_notification
    Notifications.deliver_new_offer self
  end
end
