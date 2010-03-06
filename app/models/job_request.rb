class JobRequest < ActiveRecord::Base
  belongs_to :user
  has_many :help_offers
  has_and_belongs_to_many :categories
  has_one :feedback
  
  validates_presence_of :title, :status, :user
  validates_numericality_of :duration, :greater_than => 0, :only_integer => true
  
  before_validation_on_create :set_user
  before_validation_on_create :set_status
  
  named_scope :open, :conditions => {:status => 'open'}
  named_scope :completed, :conditions => {:status => 'complete'}
  named_scope :limited, :limit => 6
  named_scope :recent, :order => 'updated_at DESC'
  
  define_index do
    indexes title, description, location
    indexes categories.name, :as => :categories
    
    has "status = 'pending'", :type => :boolean, :as => :is_pending
    has duration
    
    set_property :delta => true
  end
  
  def open!
    self.status = 'open'
    save
  end
  
  def offered!
    self.status = 'offered'
    save
  end
  
  def accepted!
    self.status = 'accepted'
    save
  end
  
  def complete!
    self.status = 'complete'
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
  
  def set_status
    self.status ||= user.email_confirmed? ? 'open' : 'pending'
  end
end
