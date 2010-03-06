class JobRequest < ActiveRecord::Base
  belongs_to :user
  has_many :help_offers
  has_and_belongs_to_many :categories
  
  define_index do 
    indexes title, description, location
    indexes categories.name, :as => :categories
  end
end
