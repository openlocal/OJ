class ChangeLocationToStringJobRequest < ActiveRecord::Migration
  def self.up
    remove_column :job_requests, :location
    add_column :job_requests, :location, :string
  end

  def self.down
    remove_column :job_requests, :location
    add_column :job_requests, :location, :text    
  end
end
