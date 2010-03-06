class AddDeltasToJobRequests < ActiveRecord::Migration
  def self.up
    add_column :job_requests, :delta, :boolean, :default => true
    
    add_index :job_requests, :delta
  end

  def self.down
    remove_index :job_requests, :delta
    remove_column :job_requests, :delta
  end
end
