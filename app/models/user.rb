class User < ActiveRecord::Base
  include Clearance::User
  
  has_many :job_requests
  attr_accessible :real_name
  before_validation_on_create :generate_password
  after_save :open_pending_jobs

  def name
    
    if real_name.blank?
      email
    else
      real_name
    end
  end
  
  private
  
  def generate_password
    return unless password.nil? && password_confirmation.nil?
    
    self.password = self.password_confirmation = random_password
  end
  
  def random_password
    encrypt(Time.now.to_s)[0..11]
  end
  
  def open_pending_jobs
    return unless email_confirmed_changed?
    
    from, to = email_confirmed_change
    if to && !from
      job_requests.each { |job| job.open! }
    end
  end
  
  
end
