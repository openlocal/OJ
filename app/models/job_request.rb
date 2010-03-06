class JobRequest < ActiveRecord::Base
  belongs_to :user
  has_many :help_offers
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
  
  def accepted_offer
    help_offers.each do |offer|
      return offer if offer.accepted
    end
    return nil
  end
  
  def help_offer_for_user(user)
    help_offers.each do |offer|
      return offer if offer.user == user
    end
    return nil
  end
  
  private
  
  def set_user
    self.user ||= User.find_or_create_by_email(email_address)
  end
end
