class JobRequest < ActiveRecord::Base
  belongs_to :user
  has_many :help_offers
  has_and_belongs_to_many :categories
  
  validates_presence_of :title
  validates_numericality_of :duration, :greater_than => 0, :only_integer => true
  
  before_create :set_user
  
  named_scope :open, :conditions => {:status => 'open'}
  
  define_index do 
    indexes title, description, location
    indexes categories.name, :as => :categories
    
    has "status = 'pending'", :type => :boolean, :as => :is_pending
    has duration
  end
  
  def open!
    self.status = 'open'
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
  
  def category_string
    categories.collect { |cat| cat.name }.join(', ')
  end
  
  def category_string=(string)
    self.categories = string.split(/,\w*/).collect { |name|
      Category.find_or_create_by_name(name.strip)
    }
  end
  
  private
  
  def set_user
    self.user ||= User.find_or_create_by_email(email_address)
  end
end
