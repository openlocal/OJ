class JobRequest < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :categories
  
  before_create :set_user
  
  define_index do 
    indexes title, description, location
    indexes categories.name, :as => :categories
    
    has "status = 'Pending'", :type => :boolean, :as => :is_pending
  end
  
  def open!
    self.status = 'Open'
    save
  end
  
  private
  
  def set_user
    self.user ||= User.create :email => email_address
  end
end
